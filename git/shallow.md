# To clone a shallow branch

$ git clone -b \<BRANCH\> --single-branch https://github.com/XXX/repo.git


# To clone a branch and init the submodules

$ git clone -b \<BRANCH\> --recurse-submodules --shallow-submodules https://github.com/XXX/repo.git
