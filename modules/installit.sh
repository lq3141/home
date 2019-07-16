
modules_ver=4.2.5
if ! [[ -d  modules-${modules_ver} ]]; then
    curl https://jaist.dl.sourceforge.net/project/modules/Modules/modules-${modules_ver}/modules-${modules_ver}.tar.gz -o modules-${modules_ver}.tar.gz
    tar zxvf modules-${modules_ver}.tar.gz
else
    echo "Info   : source code available already, skip download."
fi

# tcl_path: folder contains tclConfig.sh
tcl_path=$(dirname $(dirname `which tclsh`))/lib
tcl_ver=`echo "puts \\$tcl_version" | tclsh`

# install
prefix_root=$(cd ~;pwd)/Util/local/modules
prefix=${prefix_root}/tcl${tcl_ver}
modfiles_dir=${prefix_root}/modulefiles/${modules_ver}
echo "Info   : tcl config folder = ${tcl_path}"
echo "         config prefix     = ${prefix}"
echo "         module files dir  = ${modfiles_dir}"

cd modules-${modules_ver}
./configure --prefix=${prefix} --with-tcl=${tcl_path} --with-modulepath=${modfiles_dir}:${prefix}/${modules_ver}/modulefiles --enable-doc-install --enable-versioning --enable-example-modulefiles --enable-dotmodulespath
make && make install
cd -

if [ -d $modfiles_dir ]; then
    rm -rf $modfiles_dir
fi
cp -rL modulefiles $prefix_root

