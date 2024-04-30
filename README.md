# **DOM Converter**


![hostScan](/img/dom1.png)

Script that converts domain names to their corresponding IP address.

---

## Symbolic Link

* To use the system-level tool as an executable from a relative path, it is recommended to create a symbolic link to the /usr/bin directory from your repository directory.

```shell
chmod +x DOMconverter.sh
sudo ln -s /path/to/my/file/DOMconverter.sh /usr/bin/DOMconverter
```

---

## Use

- DOMconverter <domain_list.txt>

![hostScan used error](/img/dom2.png)


- list.txt

```txt
google.com
www.google.com
yahoo.com
facebook.com
instagram.com
```

- DOMconverter list.txt

![hostScan used error](/img/dom3.png)
