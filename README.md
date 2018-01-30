<h1><a href="https://paypal.me/e1adkarak0" ok><img src="bin/icon.png" alt="PayPal Donation" ok></a> Partial-Download A GitHub-Repository <em>(By Folder)</em> - &nbsp; &nbsp; <a href="https://paypal.me/e1adkarak0" ok><img src="https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png" alt="PayPal Donation" ok></a></h1>

This is essentially a batch-file and SVN-binaries.

Run:
<pre>
get "https://github.com/googlei18n/noto-emoji/tree/master/fonts"
</pre>

If you'll add this tool to your PATH,<br/>
you can run the <code>get.cmd</code> from any folder.

<hr/>

If you already have SVN installed on your machine you can simply follow this walkthrough:
1. browse through a repository, to a folder you wish to download and copy the page's URL.
2. replace add <code>.git</code> to the repository name.
3. remove <code>tree/</code> from the URL.
4. replace <code>master/</code> with <code>trunk/</code>. Any other branch/tag can stay as is.
5. open, on your desktop or any folder on your machine and run <code>svn export THE_URL</code>.
6. the folder will be download locally.

<pre>
for example: <code>https://github.com/googlei18n/noto-emoji/tree/master/fonts</code>,<br/>
will became <code>https://github.com/googlei18n/noto-emoji.git/trunk/fonts</code>,<br/>
and <code>svn export "https://github.com/googlei18n/noto-emoji.git/trunk/fonts"</code>.
</pre>

<hr/>

<h3>Download here: <a href="https://github.com/eladkarako/partial-download-github-repository/archive/master.zip"><strong>github.com/eladkarako/partial-download-github-repository/archive/master.zip</strong></a> (~8MB)<h3>