using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml.Linq;

class Program
{
    // Enumerate files in a folder and its subfolders recursively
    static IEnumerable<string> EnumerateFilesRecursively(string path)
    {
        foreach (var file in Directory.EnumerateFiles(path, "*", SearchOption.AllDirectories))
        {
            yield return file;
        }
    }

    // Convert byte size to a human-readable format
    static string FormatByteSize(long byteSize)
    {
        string[] units = { "B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB" };
        double size = byteSize;
        int unitIndex = 0;

        while (size >= 1000 && unitIndex < units.Length - 1)
        {
            size /= 1000; // Divide by 1000 to move to the next unit
            unitIndex++;
        }

        return $"{Math.Round(size, 2)}{units[unitIndex]}"; // Format with 2 decimal places
    }

    // Generate an HTML report summarizing the file types, counts, and sizes
    static XDocument CreateReport(IEnumerable<string> files)
    {
        var report = files
            .GroupBy(file => Path.GetExtension(file).ToLower()) // Group by file extension
            .Select(group => new
            {
                Type = group.Key,
                Count = group.Count(),
                //  System.IO.FileInfo to get the size of a file with a given path
                Size = group.Sum(file => new FileInfo(file).Length) // Total size of files in the group
            })
            .OrderByDescending(entry => entry.Size); // Sort by size in descending order

        // Create the HTML table
        var table = new XElement("table",
            new XElement("tr", 
                new XElement("th", "Type"),
                new XElement("th", "Count"),
                new XElement("th", "Size")
            ),
            report.Select(entry => new XElement("tr", 
                new XElement("td", entry.Type),
                new XElement("td", entry.Count),
                new XElement("td", FormatByteSize(entry.Size))
            ))
        );

        return new XDocument(new XElement("html", table)); // Wrap the table in an HTML structure
    }

    // Main entry point for the program
    static void Main(string[] args)
    {
        // Check for at least two arguments (input folder path and output HTML file path)
        if (args.Length < 2)
        {
            Console.WriteLine("Usage: <input folder path> <output HTML file path>");
            return;
        }

        string inputPath = args[0]; // First argument: folder path
        string outputPath = args[1]; // Second argument: output file path

        try
        {
            // Enumerate files and create the report
            var files = EnumerateFilesRecursively(inputPath);
            var report = CreateReport(files);

            // Save the report to the specified output file
            report.Save(outputPath);

            Console.WriteLine($"Report successfully saved to {outputPath}");
        }
        catch (Exception ex)
        {
            // Handle any errors
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}
