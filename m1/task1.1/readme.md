## Description of work
1. Setup git: change your global configs (add name and email, setup core text
editor):
```
git config --global user.name "rostislavkozlov07"
git config --global user.email fgguihj@gmail.com
git config --global core.editor vim
```
 Result:
```
file:/home/admin1/.gitconfig    user.name=rostislavkozlov07
file:/home/admin1/.gitconfig    user.email=fgguihj@gmail.com
file:/home/admin1/.gitconfig    core.editor=vim
```
2. I created account on GitHub:
```
rostislavkozlov07
```
3. I created new private repo on GitHub:
```
DevOps_online_Vinnytsia_2021Q2
```
4. Cloning repo to my workstation:
```
git clone https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2.git
```
5. Creating empty readme.txt file:
```
touch readme.txt
```
6. Making init commit:
```
git add readme.txt
git commit -m "Creating empty readme.txt file"
```
7. Creating develop branch and checkout on it:
```
git checkout -b develop
```
8. Creating index.html empty file. Commiting:
```
toucn index.html
git add index.html
git commit -m "Creating empty index.html file"
```
9. Creating branch with name “images”. Checkout on it. Adding images folder with
some images inside it. Commiting:
```
git checkout -b images
mkdir image/
downloading image1.jpeg, image2.jpeg, image3.jpeg into images folder
```
10. Changing my index.html. Adding images source inside it. Commiting:
```
git commit -m "Changing my index.html. Adding images source inside it"
```
11. Going back to develop branch:
```
git checkout develop
```
12. Creating branch with name “styles”. Checkout on it. Adding styles folder with
styles source inside it. Commiting:
```
git checkout -b styles
mkdir styles/
touch styles/styles.css
git add *
git commit -m "Adding styles folder with styles source inside it"
```
13. Changing my index.html. Commiting:
```
git add *
git commit -m "Changing my index.html"
```
14. Going to develop branch:
```
git checkout develop
```
15. Merge two new branches into develop:
```
git merge images
```
```
git merge styles
```
After completing the last command I got merge conflict in index.html:
```
<<<<<<< HEAD
./image1.jpeg
./image2.jpeg
./image3.jpeg
=======git 
./styles/styles.css
>>>>>>> styles
```
I edited "index.html":
```
./image1.jpeg
./image2.jpeg
./image3.jpeg

./styles/styles.css
```
After this I complied:
```
git add *
git commit -m "Resolve merge conflict"
```
After doing this actions merge conflict resolved.

16. Merging develop into master:
```
git checkout main
git merge develop
```
17. Pushing all my changes with all my branches to origin: 
```
git push origin --all
```
18. Executing command “git reflog“ and save it:
```
git reflog > task1.1_GIT.txt
git add *
git commit -m "adding task1.1_GIT.txt"
git push origin
```
## Conclusion
As a result of the work, I can say that I learned the basic git commands. I understood the concept of a version control system and learned how to work with it.


## What is DevOps? 
The word “DevOps” is a mashup of “development’ and “operations” but it represents a set of ideas and practices much larger than those two terms alone, or together. DevOps speeds up how an idea goes from development to deployment. At its core, DevOps relies on automating routine operational tasks and standardizing environments across an app’s lifecycle
