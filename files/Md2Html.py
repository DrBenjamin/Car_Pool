##### `files/Md2Html.py`
##### Car Pool
##### Open-Source, hosted on https://github.com/SeriousBenEntertainment/Car_Pool
##### Please reach out to ben@benbox.org for any questions
#### Loading needed Python libraries
import markdown
import os
import re

# Get all .md files in the `docs` folder
md_files = [f for f in os.listdir('docs') if f.endswith('.md')]
print('Markdown documents found: ' + ', '.join(md_files))

# Convert each .md file to .html
for md_file in md_files:
    with open("docs/" + md_file, "r", encoding = "utf8") as file:
        md_source = file.read()
    md_source = markdown.markdown(re.sub(r'[^\x00-\x7F]+|\x0c',' ', md_source))
    html_file = md_file.replace('.md', '.html')
    with open("docs/Html/" + html_file, "w") as file:
        file.write(md_source)
        print(html_file, ' updated!')

# Convert README, LICENSE and CHANGELOG documents
md_files = ['CHANGELOG.md', 'LICENSE']
for md_file in md_files:
    with open(md_file, "r", encoding = "utf8") as file:
        md_source = file.read()
        # Remove first 17 lines of `README.md`
        if md_file == "README.md":
            md_source = '\n'.join(md_source.split('\n')[17:])

    md_source = markdown.markdown(re.sub(r'[^\x00-\x7F]+|\x0c',' ', md_source))
    if md_file == "LICENSE":
        html_file = md_file + '.html'
    else:
        html_file = md_file.replace('.md', '.html')
    with open("docs/Html/" + html_file, "w") as file:
        file.write(md_source)
        print(html_file, ' updated!')

# Copy all png files to `docs/Html` folder
png_files = [f for f in os.listdir('docs') if f.endswith('.png')]
for png_file in png_files:
    with open("docs/" + png_file, "rb") as file:
        png_source = file.read()
    with open("docs/Html/" + png_file, "wb") as file:
        file.write(png_source)
        print(png_file, ' updated!')
