# vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO a4z/commonCompilerWarnings
    REF "${VERSION}"
    SHA512 f69f7038e7bcc334de2a10c7f649997b8bebb99e98f05d37492d6f28beb2e27f28de1ab8ad836f5275bcac90f0811498665c2fcd0be010ee60453b10e845ac5e
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
