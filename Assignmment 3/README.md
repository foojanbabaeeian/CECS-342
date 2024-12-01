using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace FileReportGenerator
{
    class Program
    {
        static void Main(string[] args)
        {
            // parse command line arguments
            string inputFolder = args[0];
            string outputFile = args[1];

            // get all files in the input folder and its subfolders
            IEnumerable<string> files = EnumerateFilesRecursively(inputFolder);

            // create the report document
            XDocument report = CreateReport(files);

            // save the report to the output file
            report.Save(outputFile);
        }

        static IEnumerable<string> EnumerateFilesRecursively(string path)
        {
            // get all files in the current folder
            IEnumerable<string> files = Directory.EnumerateFiles(path);

            // yield each file
            foreach (string file in files)
            {
                yield return file;
            }

            // get all subfolders in the current folder
            IEnumerable<string> subfolders = Directory.EnumerateDirectories(path);

            // recursively enumerate files in the subfolders
            foreach (string subfolder in subfolders)
            {
                IEnumerable<string> subfolderFiles = EnumerateFilesRecursively(subfolder);

                // yield each file in the subfolder
                foreach (string subfolderFile in subfolderFiles)
                {
                    yield return subfolderFile;
                }
            }
        }

        static string FormatByteSize(long byteSize)
        {
            string[] units = { "B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB" };
            int unitIndex = 0;

            while (byteSize >= 1000)
            {
                byteSize /= 1000;
                unitIndex++;
            }

            return $"{byteSize:F2}{units[unitIndex]}";
        }

        static XDocument CreateReport(IEnumerable<string> files)
        {
            // group the files by their extension (converted to lower case)
            var fileGroups = from file in files
                             let extension = Path.GetExtension(file).ToLower()
                             group file by extension into g
                             select g;

            // create the root element for the report
            XElement root = new XElement("html");

            // create the table element
            XElement table = new XElement("table");

            // create the table header row
            XElement headerRow = new XElement("tr",
                new XElement("th", "Type"),
                new XElement("th", "Count"),
                new XElement("th", "Size"));
            table.Add(headerRow);

            // add a row for each file group
            foreach (var fileGroup in fileGroups.OrderByDescending(g => g.Sum(f => new FileInfo(f).Length)))
            {
                // get the extension for the file group
                string extension = fileGroup.Key;

                // get the number of files and the total size for the file group
                int count = fileGroup.Count();
                long size = fileGroup.Sum(f => new FileInfo(f).Length);

                // add a row element to the table
                table.Add(new XElement("tr",
                    new XElement("td", extension),
                    new XElement("td", count),
                    new XElement("td", FormatByteSize(size))));
            }

            // add the table to the root element
            root.Add(table);

            // create the report document
            XDocument report = new XDocument(root);

            return report;
        }
    }
}