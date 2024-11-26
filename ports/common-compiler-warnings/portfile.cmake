# vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO a4z/commonCompilerWarnings
    REF "${VERSION}"
    SHA512 5c547560885eafae235c04ba1f17fa61145c56904fb57f95614a56ce74e8365b2e53a550ed28b7225a7819226e792886d8042fa2239e59a39a3fa263b98e9b99
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
