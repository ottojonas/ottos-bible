using System;
using System.IO;
using System.Security.Cryptography;

class ManagedAesSample
{
  public static void Main()
  {
    Console.WriteLine("enter message that needs to be encrypted: ");
    string data = Console.ReadLine();
    EncryptAesManaged(data);
  }
  static void EncryptAesManaged(string raw)
  {
    try
    {
      // create aes that generates a new key and initialisation vector (IV)
      // same key must be used in encryption and decryption
      using (AesManaged aes = new AesManaged())
      {
        // encrypt string print
        byte[] encrypted = Encrypt(raw, aes.Key, aes.IV);
        // print encrypted string 
        Console.WriteLine($"encrypted data: {System.Text.Encoding.UTF8.GetString(encrypted)}");
        // decrypt the bytes to a string 
        string decrypted = Decrypt(encrypted, aes.Key, aes.IV);
        // print decrypted string | should be same as raw data 
        Console.WriteLine($"decrypted data: {decrypted}");
      }
    }
    catch (Exception exp)
    {
      Console.WriteLine(exp.Message);
    }
    Console.ReadKey();
  }
  static byte[] Encrypt(string plainText, byte[] Key, byte[] IV)
  {
    byte[] encrypted;
    // create a new AesManaged
    using (AesManaged aes = new AesManaged())
    {
      // create encryptor 
      ICryptoTransform encryptor = aes.CreateEncryptor(Key, IV);
      // create memory stream
      using (MemoryStream ms = new MemoryStream())
      {
        // Create crypto stream using the CryptoStream class. This class is the key to encryption
        // and encrypts and decrypts data from any given stream. In this case, we will pass a memory stream
        // to encrypt
        using (CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
        {
          // create StreamWriter and write data to a stream 
          using (StreamWriter sw = new StreamWriter(cs))
            sw.Write(plainText);
          encrypted = ms.ToArray();
        }
      }
    }
    // return encrypted data 
    return encrypted;
  }
  static string Decrypt(byte[] cipherText, byte[] Key, byte[] IV)
  {
    string plainText = string.Empty;
    // create AesManaged 
    using (AesManaged aes = new AesManaged())
    {
      // create decryptor
      ICryptoTransform decryptor = aes.CreateDecryptor(Key, IV);
      // create streams for decryption
      using (MemoryStream ms = new MemoryStream(cipherText))
      {
        // create crypto stream
        using (CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
        {
          // read crypto stream   
          using (StreamReader reader = new StreamReader(cs))
            plainText = reader.ReadToEnd();
        }
      }
    }
    return plainText;
  }
  }

