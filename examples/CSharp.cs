using System;

public class Hello {
    public static void Main(string[] args) {
        // Print command-line arguments
        Console.WriteLine("You entered {0} arguments:", args.Length);
        for (int i = 0; i < args.Length; i++) {
            Console.WriteLine("{0}", args[i]);
        }
    }
}
