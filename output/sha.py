import hashlib
print(hashlib.sha1(open('Age-Assets-online.zip','rb').read()).hexdigest())