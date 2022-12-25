require 'openssl'
require 'openssl/oaep'
require 'base64'

string = "Hi, I'm original string"

public_key = './public_key.der'
key_path = File.read(public_key)
key = OpenSSL::PKey::RSA.new(key_path)
label = ''
md_oaep = OpenSSL::Digest::SHA256
md_mgf1 = OpenSSL::Digest::SHA1
encrypted = key.public_encrypt_oaep(string, label, md_oaep, md_mgf1)
encoded = Base64.strict_encode64(encrypted)
puts encoded