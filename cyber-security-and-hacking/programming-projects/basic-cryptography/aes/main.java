// create aesmanaged
AesManaged aes = new AesManaged(); 

// create encryptor 
ICryptoTransform encryptor = aes.CreateEncryptor(Key, IV)

// create memory stream 
MemoryStream ms = new MemoryStream()

// create cryptostream from MemoryStream and encryptor and write it
using(CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
  {
  // create streamwriter and write data to a stream 
  using(StreamWriter sw = new StreamWriter(cs))
    sw.Write(plainText)
      encrypted = ms.ToArray()
}

