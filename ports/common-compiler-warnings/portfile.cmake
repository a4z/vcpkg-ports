# vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO a4z/commonCompilerWarnings
    REF "${VERSION}"
    SHA512 41c1c156b8cbd9be9b92fbbd06641bf67dc78f58ef4cf03f0037c5a7e6f0101620d96b4bbf0c876cec1ff69fdf53ab4c32573d70a0324d6cf34dcfbb27e6a313
    HEAD_REF main
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)



vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "commonCompilerWarnings" CONFIG_PATH "lib/cmake/commonCompilerWarnings")

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")
