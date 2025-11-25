pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__integration_tests_main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__integration_tests_main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E016 : Short_Integer; pragma Import (Ada, E016, "ada__exceptions_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "system__soft_links_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "system__exception_table_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "ada__io_exceptions_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "ada__numerics_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__strings_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__strings__utf_encoding_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "ada__tags_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__strings__text_buffers_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "gnat_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "interfaces__c_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exceptions_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "ada__streams_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "system__finalization_root_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "ada__finalization_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__storage_pools_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "system__checked_pools_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "gnat__debug_pools_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "system__soft_links__initialize_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "gnatcoll__memory_E");
   E296 : Short_Integer; pragma Import (Ada, E296, "ada__assertions_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "ada__containers_E");
   E488 : Short_Integer; pragma Import (Ada, E488, "interfaces__c__strings_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "system__file_control_block_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "system__os_lib_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "system__file_io_E");
   E664 : Short_Integer; pragma Import (Ada, E664, "ada__streams__stream_io_E");
   E303 : Short_Integer; pragma Import (Ada, E303, "system__storage_pools__subpools_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "ada__strings__wide_wide_maps_E");
   E284 : Short_Integer; pragma Import (Ada, E284, "ada__strings__wide_wide_unbounded_E");
   E955 : Short_Integer; pragma Import (Ada, E955, "system__task_primitives__interrupt_operations_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "ada__calendar_E");
   E612 : Short_Integer; pragma Import (Ada, E612, "ada__calendar__delays_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "ada__calendar__time_zones_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "ada__real_time_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "ada__text_io_E");
   E580 : Short_Integer; pragma Import (Ada, E580, "ada__text_io__text_streams_E");
   E641 : Short_Integer; pragma Import (Ada, E641, "gnat__byte_order_mark_E");
   E490 : Short_Integer; pragma Import (Ada, E490, "gnat__calendar_E");
   E653 : Short_Integer; pragma Import (Ada, E653, "gnat__dynamic_htables_E");
   E734 : Short_Integer; pragma Import (Ada, E734, "gnat__secure_hashes_E");
   E736 : Short_Integer; pragma Import (Ada, E736, "gnat__secure_hashes__md5_E");
   E732 : Short_Integer; pragma Import (Ada, E732, "gnat__md5_E");
   E614 : Short_Integer; pragma Import (Ada, E614, "gnat__tty_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__strings__maps_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "ada__strings__maps__constants_E");
   E873 : Short_Integer; pragma Import (Ada, E873, "ada__strings__text_buffers__unbounded_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "ada__strings__unbounded_E");
   E397 : Short_Integer; pragma Import (Ada, E397, "system__regpat_E");
   E492 : Short_Integer; pragma Import (Ada, E492, "gnat__calendar__time_io_E");
   E476 : Short_Integer; pragma Import (Ada, E476, "gnat__directory_operations_E");
   E660 : Short_Integer; pragma Import (Ada, E660, "gnat__string_split_E");
   E953 : Short_Integer; pragma Import (Ada, E953, "system__interrupt_management__operations_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__pool_global_E");
   E495 : Short_Integer; pragma Import (Ada, E495, "gnat__expect_E");
   E610 : Short_Integer; pragma Import (Ada, E610, "gnat__expect__tty_E");
   E669 : Short_Integer; pragma Import (Ada, E669, "gnat__sockets_E");
   E672 : Short_Integer; pragma Import (Ada, E672, "gnat__sockets__poll_E");
   E676 : Short_Integer; pragma Import (Ada, E676, "gnat__sockets__thin_common_E");
   E674 : Short_Integer; pragma Import (Ada, E674, "gnat__sockets__thin_E");
   E506 : Short_Integer; pragma Import (Ada, E506, "system__random_seed_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "system__regexp_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "ada__directories_E");
   E712 : Short_Integer; pragma Import (Ada, E712, "system__tasking__initialization_E");
   E702 : Short_Integer; pragma Import (Ada, E702, "system__tasking__protected_objects_E");
   E708 : Short_Integer; pragma Import (Ada, E708, "system__tasking__protected_objects__entries_E");
   E720 : Short_Integer; pragma Import (Ada, E720, "system__tasking__queuing_E");
   E726 : Short_Integer; pragma Import (Ada, E726, "system__tasking__stages_E");
   E951 : Short_Integer; pragma Import (Ada, E951, "system__interrupts_E");
   E964 : Short_Integer; pragma Import (Ada, E964, "spawn__polls_E");
   E962 : Short_Integer; pragma Import (Ada, E962, "spawn__process_listeners_E");
   E963 : Short_Integer; pragma Import (Ada, E963, "spawn__string_vectors_E");
   E549 : Short_Integer; pragma Import (Ada, E549, "unicode_E");
   E297 : Short_Integer; pragma Import (Ada, E297, "vss_E");
   E349 : Short_Integer; pragma Import (Ada, E349, "vss__locales_E");
   E319 : Short_Integer; pragma Import (Ada, E319, "vss__stream_element_vectors_E");
   E313 : Short_Integer; pragma Import (Ada, E313, "vss__implementation__strings_E");
   E337 : Short_Integer; pragma Import (Ada, E337, "vss__implementation__referrers_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "vss__strings_E");
   E315 : Short_Integer; pragma Import (Ada, E315, "vss__implementation__text_handlers_E");
   E324 : Short_Integer; pragma Import (Ada, E324, "vss__implementation__text_handlers__nul_E");
   E331 : Short_Integer; pragma Import (Ada, E331, "vss__implementation__text_handlers__utf8__dynamic_E");
   E333 : Short_Integer; pragma Import (Ada, E333, "vss__implementation__text_handlers__utf8__static_E");
   E339 : Short_Integer; pragma Import (Ada, E339, "vss__string_vectors_E");
   E353 : Short_Integer; pragma Import (Ada, E353, "vss__strings__cursors_E");
   E360 : Short_Integer; pragma Import (Ada, E360, "vss__strings__cursors__iterators_E");
   E364 : Short_Integer; pragma Import (Ada, E364, "vss__strings__cursors__iterators__grapheme_clusters_E");
   E366 : Short_Integer; pragma Import (Ada, E366, "vss__strings__cursors__iterators__lines_E");
   E368 : Short_Integer; pragma Import (Ada, E368, "vss__strings__cursors__iterators__words_E");
   E355 : Short_Integer; pragma Import (Ada, E355, "vss__strings__cursors__markers_E");
   E362 : Short_Integer; pragma Import (Ada, E362, "vss__strings__cursors__iterators__characters_E");
   E369 : Short_Integer; pragma Import (Ada, E369, "vss__transformers_E");
   E911 : Short_Integer; pragma Import (Ada, E911, "vss__characters__latin_E");
   E382 : Short_Integer; pragma Import (Ada, E382, "vss__json__content_handlers_E");
   E374 : Short_Integer; pragma Import (Ada, E374, "vss__json__streams__cursors_E");
   E372 : Short_Integer; pragma Import (Ada, E372, "vss__json__pull_readers_E");
   E383 : Short_Integer; pragma Import (Ada, E383, "vss__text_streams_E");
   E889 : Short_Integer; pragma Import (Ada, E889, "vss__json__implementation__parsers_E");
   E519 : Short_Integer; pragma Import (Ada, E519, "annotations_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "aunit_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "aunit__memory_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "aunit__memory__utils_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "ada_containers__aunit_lists_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "aunit__tests_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "aunit__time_measure_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "aunit__test_results_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "aunit__assertions_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "aunit__test_filters_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "aunit__simple_test_cases_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "aunit__reporter_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "aunit__reporter__text_E");
   E973 : Short_Integer; pragma Import (Ada, E973, "aunit__test_cases_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "aunit__test_suites_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "aunit__run_E");
   E837 : Short_Integer; pragma Import (Ada, E837, "config_E");
   E985 : Short_Integer; pragma Import (Ada, E985, "generic_stack_E");
   E830 : Short_Integer; pragma Import (Ada, E830, "gnatcoll__any_types_E");
   E418 : Short_Integer; pragma Import (Ada, E418, "gnatcoll__atomic_E");
   E437 : Short_Integer; pragma Import (Ada, E437, "gnatcoll__os_E");
   E802 : Short_Integer; pragma Import (Ada, E802, "gnatcoll__plugins_E");
   E433 : Short_Integer; pragma Import (Ada, E433, "gnatcoll__storage_pools__headers_E");
   E431 : Short_Integer; pragma Import (Ada, E431, "gnatcoll__refcount_E");
   E436 : Short_Integer; pragma Import (Ada, E436, "gnatcoll__string_builders_E");
   E452 : Short_Integer; pragma Import (Ada, E452, "gnatcoll__os__fs_E");
   E447 : Short_Integer; pragma Import (Ada, E447, "gnatcoll__os__stat_E");
   E429 : Short_Integer; pragma Import (Ada, E429, "gnatcoll__strings_impl_E");
   E427 : Short_Integer; pragma Import (Ada, E427, "gnatcoll__strings_E");
   E426 : Short_Integer; pragma Import (Ada, E426, "gnatcoll__strings_E");
   E459 : Short_Integer; pragma Import (Ada, E459, "gnatcoll__mmap_E");
   E461 : Short_Integer; pragma Import (Ada, E461, "gnatcoll__mmap__system_E");
   E444 : Short_Integer; pragma Import (Ada, E444, "gnatcoll__buffer_E");
   E416 : Short_Integer; pragma Import (Ada, E416, "gnatcoll__json_E");
   E420 : Short_Integer; pragma Import (Ada, E420, "gnatcoll__json__utility_E");
   E512 : Short_Integer; pragma Import (Ada, E512, "gnatcoll__templates_E");
   E514 : Short_Integer; pragma Import (Ada, E514, "gnatcoll__terminal_E");
   E482 : Short_Integer; pragma Import (Ada, E482, "gnatcoll__utils_E");
   E796 : Short_Integer; pragma Import (Ada, E796, "gnatcoll__sql_impl_E");
   E794 : Short_Integer; pragma Import (Ada, E794, "gnatcoll__sql_E");
   E841 : Short_Integer; pragma Import (Ada, E841, "gnatcoll__symbols_E");
   E471 : Short_Integer; pragma Import (Ada, E471, "gnatcoll__io_E");
   E480 : Short_Integer; pragma Import (Ada, E480, "gnatcoll__path_E");
   E478 : Short_Integer; pragma Import (Ada, E478, "gnatcoll__io__native_E");
   E498 : Short_Integer; pragma Import (Ada, E498, "gnatcoll__remote_E");
   E502 : Short_Integer; pragma Import (Ada, E502, "gnatcoll__remote__db_E");
   E474 : Short_Integer; pragma Import (Ada, E474, "gnatcoll__io__remote_E");
   E497 : Short_Integer; pragma Import (Ada, E497, "gnatcoll__io__remote__unix_E");
   E500 : Short_Integer; pragma Import (Ada, E500, "gnatcoll__io__remote__windows_E");
   E463 : Short_Integer; pragma Import (Ada, E463, "gnatcoll__vfs_E");
   E510 : Short_Integer; pragma Import (Ada, E510, "gnatcoll__traces_E");
   E832 : Short_Integer; pragma Import (Ada, E832, "gnatcoll__arg_lists_E");
   E826 : Short_Integer; pragma Import (Ada, E826, "gnatcoll__scripts_E");
   E828 : Short_Integer; pragma Import (Ada, E828, "gnatcoll__scripts__impl_E");
   E834 : Short_Integer; pragma Import (Ada, E834, "gnatcoll__scripts__utils_E");
   E824 : Short_Integer; pragma Import (Ada, E824, "gnatcoll__iconv_E");
   E799 : Short_Integer; pragma Import (Ada, E799, "gnatcoll__sql__exec_E");
   E804 : Short_Integer; pragma Import (Ada, E804, "gnatcoll__sql__exec__tasking_E");
   E808 : Short_Integer; pragma Import (Ada, E808, "gnatcoll__sql__exec_private_E");
   E811 : Short_Integer; pragma Import (Ada, E811, "gnatcoll__sql__inspect_E");
   E813 : Short_Integer; pragma Import (Ada, E813, "gnatcoll__sql__sqlite_E");
   E815 : Short_Integer; pragma Import (Ada, E815, "gnatcoll__sql__sqlite__builder_E");
   E817 : Short_Integer; pragma Import (Ada, E817, "gnatcoll__sql__sqlite__gnade_E");
   E821 : Short_Integer; pragma Import (Ada, E821, "gnatcoll__sql_fields_E");
   E620 : Short_Integer; pragma Import (Ada, E620, "gnatcoll__vfs_utils_E");
   E622 : Short_Integer; pragma Import (Ada, E622, "gpr_E");
   E624 : Short_Integer; pragma Import (Ada, E624, "gpr__attr_E");
   E628 : Short_Integer; pragma Import (Ada, E628, "gpr__cset_E");
   E634 : Short_Integer; pragma Import (Ada, E634, "gpr__debug_E");
   E626 : Short_Integer; pragma Import (Ada, E626, "gpr__err_E");
   E632 : Short_Integer; pragma Import (Ada, E632, "gpr__names_E");
   E643 : Short_Integer; pragma Import (Ada, E643, "gpr__osint_E");
   E630 : Short_Integer; pragma Import (Ada, E630, "gpr__erroutc_E");
   E636 : Short_Integer; pragma Import (Ada, E636, "gpr__output_E");
   E645 : Short_Integer; pragma Import (Ada, E645, "gpr__scans_E");
   E639 : Short_Integer; pragma Import (Ada, E639, "gpr__sinput_E");
   E647 : Short_Integer; pragma Import (Ada, E647, "gpr__snames_E");
   E651 : Short_Integer; pragma Import (Ada, E651, "gpr__tempdir_E");
   E678 : Short_Integer; pragma Import (Ada, E678, "gpr__ali_E");
   E692 : Short_Integer; pragma Import (Ada, E692, "gpr__attr__pm_E");
   E698 : Short_Integer; pragma Import (Ada, E698, "gpr__ext_E");
   E986 : Short_Integer; pragma Import (Ada, E986, "indent_stack_E");
   E856 : Short_Integer; pragma Import (Ada, E856, "lsp__client_request_receivers_E");
   E929 : Short_Integer; pragma Import (Ada, E929, "lsp__client_response_senders_E");
   E865 : Short_Integer; pragma Import (Ada, E865, "lsp__server_notification_receivers_E");
   E934 : Short_Integer; pragma Import (Ada, E934, "lsp__server_request_receivers_E");
   E922 : Short_Integer; pragma Import (Ada, E922, "lsp__server_response_senders_E");
   E564 : Short_Integer; pragma Import (Ada, E564, "sax__htable_E");
   E568 : Short_Integer; pragma Import (Ada, E568, "sax__pointers_E");
   E782 : Short_Integer; pragma Import (Ada, E782, "sax__state_machines_E");
   E761 : Short_Integer; pragma Import (Ada, E761, "schema_E");
   E968 : Short_Integer; pragma Import (Ada, E968, "spawn__polls__posix_polls_E");
   E943 : Short_Integer; pragma Import (Ada, E943, "spawn__environments_E");
   E961 : Short_Integer; pragma Import (Ada, E961, "spawn__common_E");
   E958 : Short_Integer; pragma Import (Ada, E958, "spawn__channels_E");
   E966 : Short_Integer; pragma Import (Ada, E966, "spawn__environments__internal_E");
   E945 : Short_Integer; pragma Import (Ada, E945, "spawn__internal_E");
   E947 : Short_Integer; pragma Import (Ada, E947, "spawn__internal__monitor_E");
   E941 : Short_Integer; pragma Import (Ada, E941, "spawn__processes_E");
   E938 : Short_Integer; pragma Import (Ada, E938, "lsp__raw_clients_E");
   E988 : Short_Integer; pragma Import (Ada, E988, "spawn__processes__monitor_loop_E");
   E560 : Short_Integer; pragma Import (Ada, E560, "unicode__ccs_E");
   E584 : Short_Integer; pragma Import (Ada, E584, "unicode__ccs__iso_8859_1_E");
   E586 : Short_Integer; pragma Import (Ada, E586, "unicode__ccs__iso_8859_15_E");
   E591 : Short_Integer; pragma Import (Ada, E591, "unicode__ccs__iso_8859_2_E");
   E594 : Short_Integer; pragma Import (Ada, E594, "unicode__ccs__iso_8859_3_E");
   E596 : Short_Integer; pragma Import (Ada, E596, "unicode__ccs__iso_8859_4_E");
   E598 : Short_Integer; pragma Import (Ada, E598, "unicode__ccs__windows_1251_E");
   E603 : Short_Integer; pragma Import (Ada, E603, "unicode__ccs__windows_1252_E");
   E556 : Short_Integer; pragma Import (Ada, E556, "unicode__ces_E");
   E566 : Short_Integer; pragma Import (Ada, E566, "sax__symbols_E");
   E759 : Short_Integer; pragma Import (Ada, E759, "sax__locators_E");
   E757 : Short_Integer; pragma Import (Ada, E757, "sax__exceptions_E");
   E558 : Short_Integer; pragma Import (Ada, E558, "unicode__ces__utf32_E");
   E606 : Short_Integer; pragma Import (Ada, E606, "unicode__ces__basic_8bit_E");
   E608 : Short_Integer; pragma Import (Ada, E608, "unicode__ces__utf16_E");
   E562 : Short_Integer; pragma Import (Ada, E562, "unicode__ces__utf8_E");
   E755 : Short_Integer; pragma Import (Ada, E755, "sax__models_E");
   E753 : Short_Integer; pragma Import (Ada, E753, "sax__attributes_E");
   E570 : Short_Integer; pragma Import (Ada, E570, "sax__utils_E");
   E545 : Short_Integer; pragma Import (Ada, E545, "dom__core_E");
   E773 : Short_Integer; pragma Import (Ada, E773, "schema__date_time_E");
   E777 : Short_Integer; pragma Import (Ada, E777, "schema__decimal_E");
   E771 : Short_Integer; pragma Import (Ada, E771, "schema__simple_types_E");
   E582 : Short_Integer; pragma Import (Ada, E582, "unicode__encodings_E");
   E578 : Short_Integer; pragma Import (Ada, E578, "dom__core__nodes_E");
   E576 : Short_Integer; pragma Import (Ada, E576, "dom__core__attrs_E");
   E765 : Short_Integer; pragma Import (Ada, E765, "dom__core__character_datas_E");
   E572 : Short_Integer; pragma Import (Ada, E572, "dom__core__documents_E");
   E574 : Short_Integer; pragma Import (Ada, E574, "dom__core__elements_E");
   E745 : Short_Integer; pragma Import (Ada, E745, "input_sources_E");
   E747 : Short_Integer; pragma Import (Ada, E747, "input_sources__file_E");
   E751 : Short_Integer; pragma Import (Ada, E751, "input_sources__strings_E");
   E749 : Short_Integer; pragma Import (Ada, E749, "sax__readers_E");
   E780 : Short_Integer; pragma Import (Ada, E780, "schema__validators_E");
   E767 : Short_Integer; pragma Import (Ada, E767, "schema__readers_E");
   E769 : Short_Integer; pragma Import (Ada, E769, "schema__schema_readers_E");
   E784 : Short_Integer; pragma Import (Ada, E784, "schema__validators__xsd_grammar_E");
   E763 : Short_Integer; pragma Import (Ada, E763, "schema__dom_readers_E");
   E741 : Short_Integer; pragma Import (Ada, E741, "gpr__knowledge_E");
   E743 : Short_Integer; pragma Import (Ada, E743, "gpr__sdefault_E");
   E694 : Short_Integer; pragma Import (Ada, E694, "gpr__strt_E");
   E662 : Short_Integer; pragma Import (Ada, E662, "gpr__util_E");
   E730 : Short_Integer; pragma Import (Ada, E730, "gpr__compilation_E");
   E658 : Short_Integer; pragma Import (Ada, E658, "gpr__env_E");
   E700 : Short_Integer; pragma Import (Ada, E700, "gpr__jobserver_E");
   E656 : Short_Integer; pragma Import (Ada, E656, "gpr__tree_E");
   E690 : Short_Integer; pragma Import (Ada, E690, "gpr__dect_E");
   E682 : Short_Integer; pragma Import (Ada, E682, "gpr__nmsc_E");
   E688 : Short_Integer; pragma Import (Ada, E688, "gpr__part_E");
   E696 : Short_Integer; pragma Import (Ada, E696, "gpr__proc_E");
   E680 : Short_Integer; pragma Import (Ada, E680, "gpr__conf_E");
   E786 : Short_Integer; pragma Import (Ada, E786, "gpr__version_E");
   E788 : Short_Integer; pragma Import (Ada, E788, "gpr_build_util_E");
   E792 : Short_Integer; pragma Import (Ada, E792, "gpr__pp_E");
   E542 : Short_Integer; pragma Import (Ada, E542, "gnatcoll__projects_E");
   E616 : Short_Integer; pragma Import (Ada, E616, "gnatcoll__projects__krunch_E");
   E618 : Short_Integer; pragma Import (Ada, E618, "gnatcoll__projects__normalize_E");
   E540 : Short_Integer; pragma Import (Ada, E540, "gnatcoll__xref_E");
   E819 : Short_Integer; pragma Import (Ada, E819, "gnatcoll__xref__database_E");
   E538 : Short_Integer; pragma Import (Ada, E538, "basic_types_E");
   E533 : Short_Integer; pragma Import (Ada, E533, "case_handling_E");
   E387 : Short_Integer; pragma Import (Ada, E387, "uris_E");
   E836 : Short_Integer; pragma Import (Ada, E836, "utf8_utils_E");
   E521 : Short_Integer; pragma Import (Ada, E521, "string_utils_E");
   E508 : Short_Integer; pragma Import (Ada, E508, "language_E");
   E517 : Short_Integer; pragma Import (Ada, E517, "language__tree_E");
   E983 : Short_Integer; pragma Import (Ada, E983, "ada_analyzer_E");
   E981 : Short_Integer; pragma Import (Ada, E981, "language__ada_E");
   E891 : Short_Integer; pragma Import (Ada, E891, "vss__json__implementation__parsers__json_E");
   E851 : Short_Integer; pragma Import (Ada, E851, "vss__json__pull_readers__look_ahead_E");
   E886 : Short_Integer; pragma Import (Ada, E886, "vss__json__pull_readers__simple_E");
   E376 : Short_Integer; pragma Import (Ada, E376, "vss__json__push_writers_E");
   E292 : Short_Integer; pragma Import (Ada, E292, "lsp__json_streams_E");
   E290 : Short_Integer; pragma Import (Ada, E290, "lsp__generic_optional_E");
   E385 : Short_Integer; pragma Import (Ada, E385, "lsp__generic_optional_with_read_write_E");
   E845 : Short_Integer; pragma Import (Ada, E845, "lsp__generic_sets_E");
   E847 : Short_Integer; pragma Import (Ada, E847, "lsp__generic_vectors_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "lsp__types_E");
   E878 : Short_Integer; pragma Import (Ada, E878, "gps__lsp_client__partial_results_E");
   E864 : Short_Integer; pragma Import (Ada, E864, "lsp__errors_E");
   E853 : Short_Integer; pragma Import (Ada, E853, "lsp__commands_E");
   E843 : Short_Integer; pragma Import (Ada, E843, "lsp__messages_E");
   E849 : Short_Integer; pragma Import (Ada, E849, "lsp__message_io_E");
   E913 : Short_Integer; pragma Import (Ada, E913, "gps__lsp_client__text_documents_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "gps__lsp_client__utilities_E");
   E855 : Short_Integer; pragma Import (Ada, E855, "lsp__client_notification_receivers_E");
   E854 : Short_Integer; pragma Import (Ada, E854, "lsp__client_message_receivers_E");
   E921 : Short_Integer; pragma Import (Ada, E921, "lsp__generic_responses_E");
   E928 : Short_Integer; pragma Import (Ada, E928, "lsp__messages__client_responses_E");
   E862 : Short_Integer; pragma Import (Ada, E862, "lsp__messages__common_writers_E");
   E926 : Short_Integer; pragma Import (Ada, E926, "lsp__generic_notifications_E");
   E860 : Short_Integer; pragma Import (Ada, E860, "lsp__generic_requests_E");
   E924 : Short_Integer; pragma Import (Ada, E924, "lsp__messages__client_notifications_E");
   E858 : Short_Integer; pragma Import (Ada, E858, "lsp__messages__client_requests_E");
   E931 : Short_Integer; pragma Import (Ada, E931, "lsp__messages__server_notifications_E");
   E933 : Short_Integer; pragma Import (Ada, E933, "lsp__messages__server_requests_E");
   E919 : Short_Integer; pragma Import (Ada, E919, "lsp__messages__server_responses_E");
   E908 : Short_Integer; pragma Import (Ada, E908, "vss__text_streams__memory_utf8_input_E");
   E910 : Short_Integer; pragma Import (Ada, E910, "vss__text_streams__memory_utf8_output_E");
   E915 : Short_Integer; pragma Import (Ada, E915, "lsp__clients_E");
   E916 : Short_Integer; pragma Import (Ada, E916, "lsp__clients__request_handlers_E");
   E917 : Short_Integer; pragma Import (Ada, E917, "lsp__clients__response_handlers_E");
   E867 : Short_Integer; pragma Import (Ada, E867, "gps__lsp_client__callbacks_E");
   E970 : Short_Integer; pragma Import (Ada, E970, "gps__lsp_client__configurations_E");
   E871 : Short_Integer; pragma Import (Ada, E871, "gps__lsp_client__requests_E");
   E882 : Short_Integer; pragma Import (Ada, E882, "gps__lsp_client__requests__shutdown_E");
   E877 : Short_Integer; pragma Import (Ada, E877, "gps__lsp_clients_E");
   E869 : Short_Integer; pragma Import (Ada, E869, "gps__lsp_client__language_servers_E");
   E880 : Short_Integer; pragma Import (Ada, E880, "gps__lsp_clients__shutdowns_E");
   E975 : Short_Integer; pragma Import (Ada, E975, "gps__lsp_client__configurations__als_E");
   E971 : Short_Integer; pragma Import (Ada, E971, "gps__lsp_client__language_servers__interceptors_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "als_integration_callbacks_E");
   E979 : Short_Integer; pragma Import (Ada, E979, "gps__lsp_client__requests__internals_E");
   E977 : Short_Integer; pragma Import (Ada, E977, "gps__lsp_client__language_servers__real_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "integration_tests_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "integration_tests__finalize_body");
      begin
         E214 := E214 - 1;
         F1;
      end;
      E977 := E977 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gps__lsp_client__language_servers__real__finalize_spec");
      begin
         F2;
      end;
      E266 := E266 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "als_integration_callbacks__finalize_spec");
      begin
         F3;
      end;
      E975 := E975 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "gps__lsp_client__configurations__als__finalize_spec");
      begin
         F4;
      end;
      E877 := E877 - 1;
      E880 := E880 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "gps__lsp_clients__shutdowns__finalize_spec");
      begin
         F5;
      end;
      E871 := E871 - 1;
      E867 := E867 - 1;
      E869 := E869 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "gps__lsp_client__language_servers__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gps__lsp_clients__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "gps__lsp_client__requests__finalize_spec");
      begin
         F8;
      end;
      E970 := E970 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gps__lsp_client__configurations__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "gps__lsp_client__callbacks__finalize_spec");
      begin
         F10;
      end;
      E915 := E915 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "lsp__clients__finalize_spec");
      begin
         F11;
      end;
      E910 := E910 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "vss__text_streams__memory_utf8_output__finalize_spec");
      begin
         F12;
      end;
      E908 := E908 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "vss__text_streams__memory_utf8_input__finalize_spec");
      begin
         F13;
      end;
      E919 := E919 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "lsp__messages__server_responses__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "lsp__messages__server_requests__finalize_body");
      begin
         E933 := E933 - 1;
         F15;
      end;
      declare
         procedure F16;
         pragma Import (Ada, F16, "lsp__messages__server_requests__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "lsp__messages__server_notifications__finalize_body");
      begin
         E931 := E931 - 1;
         F17;
      end;
      declare
         procedure F18;
         pragma Import (Ada, F18, "lsp__messages__server_notifications__finalize_spec");
      begin
         F18;
      end;
      E858 := E858 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "lsp__messages__client_requests__finalize_spec");
      begin
         F19;
      end;
      E924 := E924 - 1;
      declare
         procedure F20;
         pragma Import (Ada, F20, "lsp__messages__client_notifications__finalize_spec");
      begin
         F20;
      end;
      E928 := E928 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "lsp__messages__client_responses__finalize_spec");
      begin
         F21;
      end;
      declare
         procedure F22;
         pragma Import (Ada, F22, "gps__lsp_client__text_documents__finalize_spec");
      begin
         E913 := E913 - 1;
         F22;
      end;
      E843 := E843 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "lsp__messages__finalize_spec");
      begin
         F23;
      end;
      declare
         procedure F24;
         pragma Import (Ada, F24, "lsp__commands__finalize_body");
      begin
         E853 := E853 - 1;
         F24;
      end;
      declare
         procedure F25;
         pragma Import (Ada, F25, "lsp__commands__finalize_spec");
      begin
         F25;
      end;
      E273 := E273 - 1;
      declare
         procedure F26;
         pragma Import (Ada, F26, "lsp__types__finalize_spec");
      begin
         F26;
      end;
      E292 := E292 - 1;
      declare
         procedure F27;
         pragma Import (Ada, F27, "lsp__json_streams__finalize_spec");
      begin
         F27;
      end;
      E376 := E376 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "vss__json__push_writers__finalize_spec");
      begin
         F28;
      end;
      E886 := E886 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "vss__json__pull_readers__simple__finalize_spec");
      begin
         F29;
      end;
      E851 := E851 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "vss__json__pull_readers__look_ahead__finalize_spec");
      begin
         F30;
      end;
      E891 := E891 - 1;
      declare
         procedure F31;
         pragma Import (Ada, F31, "vss__json__implementation__parsers__json__finalize_spec");
      begin
         F31;
      end;
      E981 := E981 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "language__ada__finalize_spec");
      begin
         F32;
      end;
      E508 := E508 - 1;
      E517 := E517 - 1;
      declare
         procedure F33;
         pragma Import (Ada, F33, "language__tree__finalize_spec");
      begin
         F33;
      end;
      declare
         procedure F34;
         pragma Import (Ada, F34, "language__finalize_spec");
      begin
         F34;
      end;
      declare
         procedure F35;
         pragma Import (Ada, F35, "uris__finalize_body");
      begin
         E387 := E387 - 1;
         F35;
      end;
      declare
         procedure F36;
         pragma Import (Ada, F36, "uris__finalize_spec");
      begin
         F36;
      end;
      E533 := E533 - 1;
      declare
         procedure F37;
         pragma Import (Ada, F37, "case_handling__finalize_spec");
      begin
         F37;
      end;
      E538 := E538 - 1;
      declare
         procedure F38;
         pragma Import (Ada, F38, "basic_types__finalize_spec");
      begin
         F38;
      end;
      declare
         procedure F39;
         pragma Import (Ada, F39, "gnatcoll__xref__finalize_body");
      begin
         E540 := E540 - 1;
         F39;
      end;
      E819 := E819 - 1;
      declare
         procedure F40;
         pragma Import (Ada, F40, "gnatcoll__xref__database__finalize_spec");
      begin
         F40;
      end;
      declare
         procedure F41;
         pragma Import (Ada, F41, "gnatcoll__xref__finalize_spec");
      begin
         F41;
      end;
      declare
         procedure F42;
         pragma Import (Ada, F42, "gnatcoll__projects__finalize_body");
      begin
         E542 := E542 - 1;
         F42;
      end;
      declare
         procedure F43;
         pragma Import (Ada, F43, "gnatcoll__projects__finalize_spec");
      begin
         F43;
      end;
      declare
         procedure F44;
         pragma Import (Ada, F44, "gpr__util__finalize_body");
      begin
         E662 := E662 - 1;
         F44;
      end;
      declare
         procedure F45;
         pragma Import (Ada, F45, "gpr_build_util__finalize_body");
      begin
         E788 := E788 - 1;
         F45;
      end;
      declare
         procedure F46;
         pragma Import (Ada, F46, "gpr_build_util__finalize_spec");
      begin
         F46;
      end;
      declare
         procedure F47;
         pragma Import (Ada, F47, "gpr__conf__finalize_body");
      begin
         E680 := E680 - 1;
         F47;
      end;
      declare
         procedure F48;
         pragma Import (Ada, F48, "gpr__proc__finalize_body");
      begin
         E696 := E696 - 1;
         F48;
      end;
      declare
         procedure F49;
         pragma Import (Ada, F49, "gpr__nmsc__finalize_body");
      begin
         E682 := E682 - 1;
         F49;
      end;
      declare
         procedure F50;
         pragma Import (Ada, F50, "gpr__knowledge__finalize_body");
      begin
         E741 := E741 - 1;
         F50;
      end;
      E700 := E700 - 1;
      declare
         procedure F51;
         pragma Import (Ada, F51, "gpr__jobserver__finalize_spec");
      begin
         F51;
      end;
      E658 := E658 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "gpr__env__finalize_spec");
      begin
         F52;
      end;
      E730 := E730 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "gpr__compilation__finalize_spec");
      begin
         F53;
      end;
      declare
         procedure F54;
         pragma Import (Ada, F54, "gpr__util__finalize_spec");
      begin
         F54;
      end;
      declare
         procedure F55;
         pragma Import (Ada, F55, "gpr__knowledge__finalize_spec");
      begin
         F55;
      end;
      E763 := E763 - 1;
      declare
         procedure F56;
         pragma Import (Ada, F56, "schema__dom_readers__finalize_spec");
      begin
         F56;
      end;
      E780 := E780 - 1;
      E767 := E767 - 1;
      E769 := E769 - 1;
      declare
         procedure F57;
         pragma Import (Ada, F57, "schema__schema_readers__finalize_spec");
      begin
         F57;
      end;
      declare
         procedure F58;
         pragma Import (Ada, F58, "schema__readers__finalize_spec");
      begin
         F58;
      end;
      declare
         procedure F59;
         pragma Import (Ada, F59, "schema__validators__finalize_spec");
      begin
         F59;
      end;
      E749 := E749 - 1;
      declare
         procedure F60;
         pragma Import (Ada, F60, "sax__readers__finalize_spec");
      begin
         F60;
      end;
      E751 := E751 - 1;
      declare
         procedure F61;
         pragma Import (Ada, F61, "input_sources__strings__finalize_spec");
      begin
         F61;
      end;
      E747 := E747 - 1;
      declare
         procedure F62;
         pragma Import (Ada, F62, "input_sources__file__finalize_spec");
      begin
         F62;
      end;
      E745 := E745 - 1;
      declare
         procedure F63;
         pragma Import (Ada, F63, "input_sources__finalize_spec");
      begin
         F63;
      end;
      E545 := E545 - 1;
      declare
         procedure F64;
         pragma Import (Ada, F64, "dom__core__finalize_spec");
      begin
         F64;
      end;
      E570 := E570 - 1;
      declare
         procedure F65;
         pragma Import (Ada, F65, "sax__utils__finalize_spec");
      begin
         F65;
      end;
      E753 := E753 - 1;
      declare
         procedure F66;
         pragma Import (Ada, F66, "sax__attributes__finalize_spec");
      begin
         F66;
      end;
      E757 := E757 - 1;
      declare
         procedure F67;
         pragma Import (Ada, F67, "sax__exceptions__finalize_spec");
      begin
         F67;
      end;
      E566 := E566 - 1;
      declare
         procedure F68;
         pragma Import (Ada, F68, "sax__symbols__finalize_spec");
      begin
         F68;
      end;
      E938 := E938 - 1;
      declare
         procedure F69;
         pragma Import (Ada, F69, "lsp__raw_clients__finalize_spec");
      begin
         F69;
      end;
      E941 := E941 - 1;
      declare
         procedure F70;
         pragma Import (Ada, F70, "spawn__processes__finalize_spec");
      begin
         F70;
      end;
      E945 := E945 - 1;
      declare
         procedure F71;
         pragma Import (Ada, F71, "spawn__internal__monitor__finalize_body");
      begin
         E947 := E947 - 1;
         F71;
      end;
      declare
         procedure F72;
         pragma Import (Ada, F72, "spawn__environments__finalize_body");
      begin
         E943 := E943 - 1;
         F72;
      end;
      E958 := E958 - 1;
      declare
         procedure F73;
         pragma Import (Ada, F73, "spawn__internal__finalize_spec");
      begin
         F73;
      end;
      declare
         procedure F74;
         pragma Import (Ada, F74, "spawn__channels__finalize_spec");
      begin
         F74;
      end;
      E961 := E961 - 1;
      declare
         procedure F75;
         pragma Import (Ada, F75, "spawn__common__finalize_spec");
      begin
         F75;
      end;
      declare
         procedure F76;
         pragma Import (Ada, F76, "spawn__environments__finalize_spec");
      begin
         F76;
      end;
      E968 := E968 - 1;
      declare
         procedure F77;
         pragma Import (Ada, F77, "spawn__polls__posix_polls__finalize_spec");
      begin
         F77;
      end;
      E568 := E568 - 1;
      declare
         procedure F78;
         pragma Import (Ada, F78, "sax__pointers__finalize_spec");
      begin
         F78;
      end;
      declare
         procedure F79;
         pragma Import (Ada, F79, "lsp__server_request_receivers__finalize_spec");
      begin
         E934 := E934 - 1;
         F79;
      end;
      declare
         procedure F80;
         pragma Import (Ada, F80, "lsp__server_notification_receivers__finalize_spec");
      begin
         E865 := E865 - 1;
         F80;
      end;
      E698 := E698 - 1;
      declare
         procedure F81;
         pragma Import (Ada, F81, "gpr__ext__finalize_spec");
      begin
         F81;
      end;
      E622 := E622 - 1;
      declare
         procedure F82;
         pragma Import (Ada, F82, "gpr__sinput__finalize_body");
      begin
         E639 := E639 - 1;
         F82;
      end;
      declare
         procedure F83;
         pragma Import (Ada, F83, "gpr__names__finalize_body");
      begin
         E632 := E632 - 1;
         F83;
      end;
      declare
         procedure F84;
         pragma Import (Ada, F84, "gpr__finalize_spec");
      begin
         F84;
      end;
      E821 := E821 - 1;
      declare
         procedure F85;
         pragma Import (Ada, F85, "gnatcoll__sql_fields__finalize_spec");
      begin
         F85;
      end;
      declare
         procedure F86;
         pragma Import (Ada, F86, "gnatcoll__sql__sqlite__builder__finalize_body");
      begin
         E815 := E815 - 1;
         F86;
      end;
      declare
         procedure F87;
         pragma Import (Ada, F87, "gnatcoll__sql__sqlite__finalize_body");
      begin
         E813 := E813 - 1;
         F87;
      end;
      declare
         procedure F88;
         pragma Import (Ada, F88, "gnatcoll__sql__sqlite__finalize_spec");
      begin
         F88;
      end;
      declare
         procedure F89;
         pragma Import (Ada, F89, "gnatcoll__sql__inspect__finalize_body");
      begin
         E811 := E811 - 1;
         F89;
      end;
      declare
         procedure F90;
         pragma Import (Ada, F90, "gnatcoll__sql__inspect__finalize_spec");
      begin
         F90;
      end;
      declare
         procedure F91;
         pragma Import (Ada, F91, "gnatcoll__sql__exec__tasking__finalize_body");
      begin
         E804 := E804 - 1;
         F91;
      end;
      declare
         procedure F92;
         pragma Import (Ada, F92, "gnatcoll__sql__exec__finalize_body");
      begin
         E799 := E799 - 1;
         F92;
      end;
      declare
         procedure F93;
         pragma Import (Ada, F93, "gnatcoll__sql__exec__finalize_spec");
      begin
         F93;
      end;
      E832 := E832 - 1;
      declare
         procedure F94;
         pragma Import (Ada, F94, "gnatcoll__scripts__finalize_body");
      begin
         E826 := E826 - 1;
         F94;
      end;
      declare
         procedure F95;
         pragma Import (Ada, F95, "gnatcoll__scripts__impl__finalize_body");
      begin
         E828 := E828 - 1;
         F95;
      end;
      declare
         procedure F96;
         pragma Import (Ada, F96, "gnatcoll__scripts__finalize_spec");
      begin
         F96;
      end;
      declare
         procedure F97;
         pragma Import (Ada, F97, "gnatcoll__arg_lists__finalize_spec");
      begin
         F97;
      end;
      declare
         procedure F98;
         pragma Import (Ada, F98, "gnatcoll__traces__finalize_body");
      begin
         E510 := E510 - 1;
         F98;
      end;
      declare
         procedure F99;
         pragma Import (Ada, F99, "gnatcoll__traces__finalize_spec");
      begin
         F99;
      end;
      E463 := E463 - 1;
      declare
         procedure F100;
         pragma Import (Ada, F100, "gnatcoll__vfs__finalize_spec");
      begin
         F100;
      end;
      E474 := E474 - 1;
      declare
         procedure F101;
         pragma Import (Ada, F101, "gnatcoll__io__remote__finalize_spec");
      begin
         F101;
      end;
      declare
         procedure F102;
         pragma Import (Ada, F102, "gnatcoll__remote__finalize_spec");
      begin
         E498 := E498 - 1;
         F102;
      end;
      E478 := E478 - 1;
      declare
         procedure F103;
         pragma Import (Ada, F103, "gnatcoll__io__native__finalize_spec");
      begin
         F103;
      end;
      E471 := E471 - 1;
      declare
         procedure F104;
         pragma Import (Ada, F104, "gnatcoll__io__finalize_spec");
      begin
         F104;
      end;
      E841 := E841 - 1;
      declare
         procedure F105;
         pragma Import (Ada, F105, "gnatcoll__symbols__finalize_spec");
      begin
         F105;
      end;
      declare
         procedure F106;
         pragma Import (Ada, F106, "gnatcoll__sql__finalize_body");
      begin
         E794 := E794 - 1;
         F106;
      end;
      declare
         procedure F107;
         pragma Import (Ada, F107, "gnatcoll__sql__finalize_spec");
      begin
         F107;
      end;
      declare
         procedure F108;
         pragma Import (Ada, F108, "gnatcoll__sql_impl__finalize_body");
      begin
         E796 := E796 - 1;
         F108;
      end;
      declare
         procedure F109;
         pragma Import (Ada, F109, "gnatcoll__sql_impl__finalize_spec");
      begin
         F109;
      end;
      E514 := E514 - 1;
      declare
         procedure F110;
         pragma Import (Ada, F110, "gnatcoll__terminal__finalize_spec");
      begin
         F110;
      end;
      E416 := E416 - 1;
      declare
         procedure F111;
         pragma Import (Ada, F111, "gnatcoll__json__finalize_spec");
      begin
         F111;
      end;
      E444 := E444 - 1;
      declare
         procedure F112;
         pragma Import (Ada, F112, "gnatcoll__buffer__finalize_spec");
      begin
         F112;
      end;
      E427 := E427 - 1;
      declare
         procedure F113;
         pragma Import (Ada, F113, "gnatcoll__strings__finalize_spec");
      begin
         F113;
      end;
      E431 := E431 - 1;
      declare
         procedure F114;
         pragma Import (Ada, F114, "gnatcoll__refcount__finalize_spec");
      begin
         F114;
      end;
      declare
         procedure F115;
         pragma Import (Ada, F115, "config__finalize_spec");
      begin
         E837 := E837 - 1;
         F115;
      end;
      E212 := E212 - 1;
      declare
         procedure F116;
         pragma Import (Ada, F116, "aunit__test_suites__finalize_spec");
      begin
         F116;
      end;
      E973 := E973 - 1;
      declare
         procedure F117;
         pragma Import (Ada, F117, "aunit__test_cases__finalize_spec");
      begin
         F117;
      end;
      E205 := E205 - 1;
      declare
         procedure F118;
         pragma Import (Ada, F118, "aunit__reporter__text__finalize_spec");
      begin
         F118;
      end;
      E137 := E137 - 1;
      E139 := E139 - 1;
      declare
         procedure F119;
         pragma Import (Ada, F119, "aunit__simple_test_cases__finalize_spec");
      begin
         F119;
      end;
      declare
         procedure F120;
         pragma Import (Ada, F120, "aunit__test_filters__finalize_spec");
      begin
         F120;
      end;
      E141 := E141 - 1;
      declare
         procedure F121;
         pragma Import (Ada, F121, "aunit__assertions__finalize_spec");
      begin
         F121;
      end;
      E148 := E148 - 1;
      declare
         procedure F122;
         pragma Import (Ada, F122, "aunit__test_results__finalize_spec");
      begin
         F122;
      end;
      declare
         procedure F123;
         pragma Import (Ada, F123, "aunit__tests__finalize_spec");
      begin
         E165 := E165 - 1;
         F123;
      end;
      E889 := E889 - 1;
      declare
         procedure F124;
         pragma Import (Ada, F124, "vss__json__implementation__parsers__finalize_spec");
      begin
         F124;
      end;
      declare
         procedure F125;
         pragma Import (Ada, F125, "vss__text_streams__finalize_spec");
      begin
         E383 := E383 - 1;
         F125;
      end;
      E382 := E382 - 1;
      declare
         procedure F126;
         pragma Import (Ada, F126, "vss__json__content_handlers__finalize_spec");
      begin
         F126;
      end;
      E368 := E368 - 1;
      E366 := E366 - 1;
      E364 := E364 - 1;
      E301 := E301 - 1;
      E339 := E339 - 1;
      E331 := E331 - 1;
      E324 := E324 - 1;
      declare
         procedure F127;
         pragma Import (Ada, F127, "vss__implementation__strings__finalize_body");
      begin
         E313 := E313 - 1;
         F127;
      end;
      E337 := E337 - 1;
      E362 := E362 - 1;
      declare
         procedure F128;
         pragma Import (Ada, F128, "vss__strings__cursors__iterators__characters__finalize_spec");
      begin
         F128;
      end;
      E355 := E355 - 1;
      declare
         procedure F129;
         pragma Import (Ada, F129, "vss__strings__cursors__markers__finalize_spec");
      begin
         F129;
      end;
      declare
         procedure F130;
         pragma Import (Ada, F130, "vss__strings__cursors__iterators__words__finalize_spec");
      begin
         F130;
      end;
      declare
         procedure F131;
         pragma Import (Ada, F131, "vss__strings__cursors__iterators__lines__finalize_spec");
      begin
         F131;
      end;
      declare
         procedure F132;
         pragma Import (Ada, F132, "vss__strings__cursors__iterators__grapheme_clusters__finalize_spec");
      begin
         F132;
      end;
      declare
         procedure F133;
         pragma Import (Ada, F133, "vss__string_vectors__finalize_spec");
      begin
         F133;
      end;
      E333 := E333 - 1;
      declare
         procedure F134;
         pragma Import (Ada, F134, "vss__implementation__text_handlers__utf8__static__finalize_spec");
      begin
         F134;
      end;
      declare
         procedure F135;
         pragma Import (Ada, F135, "vss__implementation__text_handlers__utf8__dynamic__finalize_spec");
      begin
         F135;
      end;
      declare
         procedure F136;
         pragma Import (Ada, F136, "vss__implementation__text_handlers__nul__finalize_spec");
      begin
         F136;
      end;
      declare
         procedure F137;
         pragma Import (Ada, F137, "vss__strings__finalize_spec");
      begin
         F137;
      end;
      declare
         procedure F138;
         pragma Import (Ada, F138, "vss__implementation__referrers__finalize_spec");
      begin
         F138;
      end;
      declare
         procedure F139;
         pragma Import (Ada, F139, "vss__implementation__strings__finalize_spec");
      begin
         F139;
      end;
      E319 := E319 - 1;
      declare
         procedure F140;
         pragma Import (Ada, F140, "vss__stream_element_vectors__finalize_spec");
      begin
         F140;
      end;
      E349 := E349 - 1;
      declare
         procedure F141;
         pragma Import (Ada, F141, "vss__locales__finalize_spec");
      begin
         F141;
      end;
      declare
         procedure F142;
         pragma Import (Ada, F142, "spawn__string_vectors__finalize_spec");
      begin
         E963 := E963 - 1;
         F142;
      end;
      declare
         procedure F143;
         pragma Import (Ada, F143, "spawn__process_listeners__finalize_spec");
      begin
         E962 := E962 - 1;
         F143;
      end;
      E951 := E951 - 1;
      declare
         procedure F144;
         pragma Import (Ada, F144, "system__interrupts__finalize_spec");
      begin
         F144;
      end;
      E708 := E708 - 1;
      declare
         procedure F145;
         pragma Import (Ada, F145, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F145;
      end;
      declare
         procedure F146;
         pragma Import (Ada, F146, "ada__directories__finalize_body");
      begin
         E216 := E216 - 1;
         F146;
      end;
      declare
         procedure F147;
         pragma Import (Ada, F147, "ada__directories__finalize_spec");
      begin
         F147;
      end;
      E238 := E238 - 1;
      declare
         procedure F148;
         pragma Import (Ada, F148, "system__regexp__finalize_spec");
      begin
         F148;
      end;
      declare
         procedure F149;
         pragma Import (Ada, F149, "gnat__sockets__finalize_body");
      begin
         E669 := E669 - 1;
         F149;
      end;
      declare
         procedure F150;
         pragma Import (Ada, F150, "gnat__sockets__finalize_spec");
      begin
         F150;
      end;
      E610 := E610 - 1;
      declare
         procedure F151;
         pragma Import (Ada, F151, "gnat__expect__tty__finalize_spec");
      begin
         F151;
      end;
      E495 := E495 - 1;
      declare
         procedure F152;
         pragma Import (Ada, F152, "gnat__expect__finalize_spec");
      begin
         F152;
      end;
      E167 := E167 - 1;
      declare
         procedure F153;
         pragma Import (Ada, F153, "system__pool_global__finalize_spec");
      begin
         F153;
      end;
      E660 := E660 - 1;
      declare
         procedure F154;
         pragma Import (Ada, F154, "gnat__string_split__finalize_spec");
      begin
         F154;
      end;
      E235 := E235 - 1;
      declare
         procedure F155;
         pragma Import (Ada, F155, "ada__strings__unbounded__finalize_spec");
      begin
         F155;
      end;
      E873 := E873 - 1;
      declare
         procedure F156;
         pragma Import (Ada, F156, "ada__strings__text_buffers__unbounded__finalize_spec");
      begin
         F156;
      end;
      E732 := E732 - 1;
      declare
         procedure F157;
         pragma Import (Ada, F157, "gnat__md5__finalize_spec");
      begin
         F157;
      end;
      E095 := E095 - 1;
      declare
         procedure F158;
         pragma Import (Ada, F158, "ada__text_io__finalize_spec");
      begin
         F158;
      end;
      E284 := E284 - 1;
      declare
         procedure F159;
         pragma Import (Ada, F159, "ada__strings__wide_wide_unbounded__finalize_spec");
      begin
         F159;
      end;
      E277 := E277 - 1;
      declare
         procedure F160;
         pragma Import (Ada, F160, "ada__strings__wide_wide_maps__finalize_spec");
      begin
         F160;
      end;
      E303 := E303 - 1;
      declare
         procedure F161;
         pragma Import (Ada, F161, "system__storage_pools__subpools__finalize_spec");
      begin
         F161;
      end;
      E664 := E664 - 1;
      declare
         procedure F162;
         pragma Import (Ada, F162, "ada__streams__stream_io__finalize_spec");
      begin
         F162;
      end;
      declare
         procedure F163;
         pragma Import (Ada, F163, "system__file_io__finalize_body");
      begin
         E100 := E100 - 1;
         F163;
      end;
      declare
         procedure F164;
         pragma Import (Ada, F164, "gnatcoll__memory__finalize_body");
      begin
         E172 := E172 - 1;
         F164;
      end;
      declare
         procedure F165;
         pragma Import (Ada, F165, "gnat__debug_pools__finalize_body");
      begin
         E175 := E175 - 1;
         F165;
      end;
      declare
         procedure F166;
         pragma Import (Ada, F166, "gnat__debug_pools__finalize_spec");
      begin
         F166;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");
      Interrupts_Default_To_System : Integer;
      pragma Import (C, Interrupts_Default_To_System, "__gl_interrupts_default_to_system");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      procedure Tasking_Runtime_Initialize;
      pragma Import (C, Tasking_Runtime_Initialize, "__gnat_tasking_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, True, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (True, True, False, True, True, True, True, False, 
           True, False, False, True, True, True, True, False, 
           True, False, False, True, False, False, True, True, 
           False, True, True, False, True, True, True, True, 
           False, True, False, False, False, True, True, False, 
           False, True, False, True, False, True, True, False, 
           True, False, True, True, False, True, True, False, 
           True, False, True, True, True, False, False, False, 
           False, True, False, True, True, True, True, False, 
           True, False, True, True, True, False, True, True, 
           False, True, True, True, True, False, False, False, 
           True, False, False, False, False, True, True, True, 
           True, False, True, False),
         Count => (0, 0, 0, 2, 9, 10, 2, 0, 3, 0),
         Unknown => (False, False, False, False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);
      Tasking_Runtime_Initialize;

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E010 := E010 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E086 := E086 + 1;
      Ada.Numerics'Elab_Spec;
      E025 := E025 + 1;
      Ada.Strings'Elab_Spec;
      E007 := E007 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E065 := E065 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      E005 := E005 + 1;
      Gnat'Elab_Spec;
      E173 := E173 + 1;
      Interfaces.C'Elab_Spec;
      E108 := E108 + 1;
      System.Exceptions'Elab_Spec;
      E019 := E019 + 1;
      Ada.Streams'Elab_Spec;
      E085 := E085 + 1;
      System.Finalization_Root'Elab_Spec;
      E103 := E103 + 1;
      Ada.Finalization'Elab_Spec;
      E101 := E101 + 1;
      System.Storage_Pools'Elab_Spec;
      E194 := E194 + 1;
      System.Checked_Pools'Elab_Spec;
      E192 := E192 + 1;
      Gnat.Debug_Pools'Elab_Spec;
      E057 := E057 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E053 := E053 + 1;
      E012 := E012 + 1;
      E016 := E016 + 1;
      Gnat.Debug_Pools'Elab_Body;
      E175 := E175 + 1;
      GNATCOLL.MEMORY'ELAB_BODY;
      E172 := E172 + 1;
      Ada.Assertions'Elab_Spec;
      E296 := E296 + 1;
      Ada.Containers'Elab_Spec;
      E225 := E225 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E488 := E488 + 1;
      System.File_Control_Block'Elab_Spec;
      E119 := E119 + 1;
      System.Os_Lib'Elab_Body;
      E111 := E111 + 1;
      System.File_Io'Elab_Body;
      E100 := E100 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E664 := E664 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E303 := E303 + 1;
      Ada.Strings.Wide_Wide_Maps'Elab_Spec;
      E277 := E277 + 1;
      Ada.Strings.Wide_Wide_Unbounded'Elab_Spec;
      E284 := E284 + 1;
      System.Task_Primitives.Interrupt_Operations'Elab_Body;
      E955 := E955 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E162 := E162 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E612 := E612 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E220 := E220 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E240 := E240 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E095 := E095 + 1;
      Ada.Text_Io.Text_Streams'Elab_Spec;
      E580 := E580 + 1;
      E641 := E641 + 1;
      Gnat.Calendar'Elab_Spec;
      E490 := E490 + 1;
      E653 := E653 + 1;
      E734 := E734 + 1;
      E736 := E736 + 1;
      Gnat.Md5'Elab_Spec;
      E732 := E732 + 1;
      E614 := E614 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E154 := E154 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E224 := E224 + 1;
      Ada.Strings.Text_Buffers.Unbounded'Elab_Spec;
      E873 := E873 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E235 := E235 + 1;
      System.Regpat'Elab_Spec;
      E397 := E397 + 1;
      Gnat.Calendar.Time_Io'Elab_Spec;
      E492 := E492 + 1;
      Gnat.Directory_Operations'Elab_Spec;
      Gnat.Directory_Operations'Elab_Body;
      E476 := E476 + 1;
      Gnat.String_Split'Elab_Spec;
      E660 := E660 + 1;
      System.Interrupt_Management.Operations'Elab_Body;
      E953 := E953 + 1;
      System.Pool_Global'Elab_Spec;
      E167 := E167 + 1;
      Gnat.Expect'Elab_Spec;
      E495 := E495 + 1;
      Gnat.Expect.Tty'Elab_Spec;
      Gnat.Expect.Tty'Elab_Body;
      E610 := E610 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E676 := E676 + 1;
      E674 := E674 + 1;
      Gnat.Sockets'Elab_Body;
      E669 := E669 + 1;
      E672 := E672 + 1;
      System.Random_Seed'Elab_Body;
      E506 := E506 + 1;
      System.Regexp'Elab_Spec;
      E238 := E238 + 1;
      Ada.Directories'Elab_Spec;
      Ada.Directories'Elab_Body;
      E216 := E216 + 1;
      System.Tasking.Initialization'Elab_Body;
      E712 := E712 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E702 := E702 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E708 := E708 + 1;
      System.Tasking.Queuing'Elab_Body;
      E720 := E720 + 1;
      System.Tasking.Stages'Elab_Body;
      E726 := E726 + 1;
      System.Interrupts'Elab_Spec;
      System.Interrupts'Elab_Body;
      E951 := E951 + 1;
      Spawn.Polls'Elab_Spec;
      E964 := E964 + 1;
      Spawn.Process_Listeners'Elab_Spec;
      E962 := E962 + 1;
      Spawn.String_Vectors'Elab_Spec;
      E963 := E963 + 1;
      Unicode'Elab_Body;
      E549 := E549 + 1;
      VSS'ELAB_SPEC;
      E297 := E297 + 1;
      VSS.LOCALES'ELAB_SPEC;
      E349 := E349 + 1;
      VSS.STREAM_ELEMENT_VECTORS'ELAB_SPEC;
      E319 := E319 + 1;
      VSS.IMPLEMENTATION.STRINGS'ELAB_SPEC;
      VSS.IMPLEMENTATION.REFERRERS'ELAB_SPEC;
      VSS.STRINGS'ELAB_SPEC;
      VSS.IMPLEMENTATION.TEXT_HANDLERS'ELAB_SPEC;
      E315 := E315 + 1;
      VSS.IMPLEMENTATION.TEXT_HANDLERS.NUL'ELAB_SPEC;
      VSS.IMPLEMENTATION.TEXT_HANDLERS.UTF8.DYNAMIC'ELAB_SPEC;
      VSS.IMPLEMENTATION.TEXT_HANDLERS.UTF8.STATIC'ELAB_SPEC;
      E333 := E333 + 1;
      VSS.STRING_VECTORS'ELAB_SPEC;
      VSS.STRINGS.CURSORS'ELAB_SPEC;
      VSS.STRINGS.CURSORS.ITERATORS'ELAB_SPEC;
      E360 := E360 + 1;
      VSS.STRINGS.CURSORS.ITERATORS.GRAPHEME_CLUSTERS'ELAB_SPEC;
      VSS.STRINGS.CURSORS.ITERATORS.LINES'ELAB_SPEC;
      VSS.STRINGS.CURSORS.ITERATORS.WORDS'ELAB_SPEC;
      VSS.STRINGS.CURSORS.MARKERS'ELAB_SPEC;
      E355 := E355 + 1;
      VSS.STRINGS.CURSORS.ITERATORS.CHARACTERS'ELAB_SPEC;
      E362 := E362 + 1;
      VSS.TRANSFORMERS'ELAB_SPEC;
      E369 := E369 + 1;
      E337 := E337 + 1;
      VSS.IMPLEMENTATION.STRINGS'ELAB_BODY;
      E313 := E313 + 1;
      E324 := E324 + 1;
      E331 := E331 + 1;
      E339 := E339 + 1;
      E301 := E301 + 1;
      E353 := E353 + 1;
      E364 := E364 + 1;
      E366 := E366 + 1;
      E368 := E368 + 1;
      VSS.CHARACTERS.LATIN'ELAB_SPEC;
      E911 := E911 + 1;
      VSS.JSON.CONTENT_HANDLERS'ELAB_SPEC;
      E382 := E382 + 1;
      VSS.JSON.STREAMS.CURSORS'ELAB_SPEC;
      E374 := E374 + 1;
      VSS.JSON.PULL_READERS'ELAB_SPEC;
      E372 := E372 + 1;
      VSS.TEXT_STREAMS'ELAB_SPEC;
      E383 := E383 + 1;
      VSS.JSON.IMPLEMENTATION.PARSERS'ELAB_SPEC;
      E889 := E889 + 1;
      E519 := E519 + 1;
      E081 := E081 + 1;
      E079 := E079 + 1;
      E146 := E146 + 1;
      E143 := E143 + 1;
      Aunit.Tests'Elab_Spec;
      E165 := E165 + 1;
      Aunit.Time_Measure'Elab_Spec;
      E150 := E150 + 1;
      Aunit.Test_Results'Elab_Spec;
      E148 := E148 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E141 := E141 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E139 := E139 + 1;
      E137 := E137 + 1;
      Aunit.Reporter'Elab_Spec;
      E083 := E083 + 1;
      Aunit.Reporter.Text'Elab_Spec;
      E205 := E205 + 1;
      Aunit.Test_Cases'Elab_Spec;
      E973 := E973 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E212 := E212 + 1;
      E210 := E210 + 1;
      Config'Elab_Spec;
      E837 := E837 + 1;
      E985 := E985 + 1;
      E830 := E830 + 1;
      E418 := E418 + 1;
      GNATCOLL.OS'ELAB_SPEC;
      E437 := E437 + 1;
      E802 := E802 + 1;
      E433 := E433 + 1;
      GNATCOLL.REFCOUNT'ELAB_SPEC;
      E431 := E431 + 1;
      E436 := E436 + 1;
      E452 := E452 + 1;
      E447 := E447 + 1;
      E429 := E429 + 1;
      GNATCOLL.STRINGS'ELAB_SPEC;
      GNATCOLL.STRINGS'ELAB_BODY;
      E427 := E427 + 1;
      GNATCOLL.MMAP'ELAB_SPEC;
      E461 := E461 + 1;
      E459 := E459 + 1;
      GNATCOLL.BUFFER'ELAB_SPEC;
      GNATCOLL.BUFFER'ELAB_BODY;
      E444 := E444 + 1;
      GNATCOLL.JSON'ELAB_SPEC;
      E420 := E420 + 1;
      GNATCOLL.JSON'ELAB_BODY;
      E416 := E416 + 1;
      GNATCOLL.TEMPLATES'ELAB_SPEC;
      E512 := E512 + 1;
      GNATCOLL.TERMINAL'ELAB_SPEC;
      GNATCOLL.TERMINAL'ELAB_BODY;
      E514 := E514 + 1;
      E482 := E482 + 1;
      GNATCOLL.SQL_IMPL'ELAB_SPEC;
      GNATCOLL.SQL_IMPL'ELAB_BODY;
      E796 := E796 + 1;
      GNATCOLL.SQL'ELAB_SPEC;
      GNATCOLL.SQL'ELAB_BODY;
      E794 := E794 + 1;
      GNATCOLL.SYMBOLS'ELAB_SPEC;
      GNATCOLL.SYMBOLS'ELAB_BODY;
      E841 := E841 + 1;
      GNATCOLL.IO'ELAB_SPEC;
      GNATCOLL.IO'ELAB_BODY;
      E471 := E471 + 1;
      GNATCOLL.PATH'ELAB_SPEC;
      GNATCOLL.PATH'ELAB_BODY;
      E480 := E480 + 1;
      GNATCOLL.IO.NATIVE'ELAB_SPEC;
      GNATCOLL.IO.NATIVE'ELAB_BODY;
      E478 := E478 + 1;
      GNATCOLL.REMOTE'ELAB_SPEC;
      E498 := E498 + 1;
      GNATCOLL.REMOTE.DB'ELAB_SPEC;
      E502 := E502 + 1;
      GNATCOLL.IO.REMOTE'ELAB_SPEC;
      E497 := E497 + 1;
      E500 := E500 + 1;
      GNATCOLL.IO.REMOTE'ELAB_BODY;
      E474 := E474 + 1;
      GNATCOLL.VFS'ELAB_SPEC;
      GNATCOLL.VFS'ELAB_BODY;
      E463 := E463 + 1;
      GNATCOLL.TRACES'ELAB_SPEC;
      GNATCOLL.TRACES'ELAB_BODY;
      E510 := E510 + 1;
      GNATCOLL.ARG_LISTS'ELAB_SPEC;
      GNATCOLL.SCRIPTS'ELAB_SPEC;
      GNATCOLL.SCRIPTS.IMPL'ELAB_BODY;
      E828 := E828 + 1;
      GNATCOLL.SCRIPTS'ELAB_BODY;
      E826 := E826 + 1;
      E834 := E834 + 1;
      E832 := E832 + 1;
      GNATCOLL.ICONV'ELAB_SPEC;
      GNATCOLL.ICONV'ELAB_BODY;
      E824 := E824 + 1;
      GNATCOLL.SQL.EXEC'ELAB_SPEC;
      GNATCOLL.SQL.EXEC_PRIVATE'ELAB_SPEC;
      GNATCOLL.SQL.EXEC_PRIVATE'ELAB_BODY;
      E808 := E808 + 1;
      GNATCOLL.SQL.EXEC'ELAB_BODY;
      E799 := E799 + 1;
      GNATCOLL.SQL.EXEC.TASKING'ELAB_BODY;
      E804 := E804 + 1;
      GNATCOLL.SQL.INSPECT'ELAB_SPEC;
      GNATCOLL.SQL.INSPECT'ELAB_BODY;
      E811 := E811 + 1;
      GNATCOLL.SQL.SQLITE'ELAB_SPEC;
      GNATCOLL.SQL.SQLITE'ELAB_BODY;
      E813 := E813 + 1;
      GNATCOLL.SQL.SQLITE.GNADE'ELAB_SPEC;
      GNATCOLL.SQL.SQLITE.GNADE'ELAB_BODY;
      E817 := E817 + 1;
      GNATCOLL.SQL.SQLITE.BUILDER'ELAB_BODY;
      E815 := E815 + 1;
      GNATCOLL.SQL_FIELDS'ELAB_SPEC;
      E821 := E821 + 1;
      GNATCOLL.VFS_UTILS'ELAB_SPEC;
      E620 := E620 + 1;
      GPR'ELAB_SPEC;
      GPR.ATTR'ELAB_SPEC;
      GPR.CSET'ELAB_BODY;
      E628 := E628 + 1;
      E634 := E634 + 1;
      GPR.OSINT'ELAB_SPEC;
      GPR.ERROUTC'ELAB_SPEC;
      GPR.OUTPUT'ELAB_BODY;
      E636 := E636 + 1;
      GPR.NAMES'ELAB_BODY;
      E632 := E632 + 1;
      GPR.OSINT'ELAB_BODY;
      E643 := E643 + 1;
      E645 := E645 + 1;
      GPR.SINPUT'ELAB_SPEC;
      GPR.SINPUT'ELAB_BODY;
      E639 := E639 + 1;
      E630 := E630 + 1;
      E647 := E647 + 1;
      GPR.ATTR'ELAB_BODY;
      E624 := E624 + 1;
      E626 := E626 + 1;
      GPR.TEMPDIR'ELAB_BODY;
      E651 := E651 + 1;
      GPR'ELAB_BODY;
      E622 := E622 + 1;
      GPR.ALI'ELAB_SPEC;
      E678 := E678 + 1;
      E692 := E692 + 1;
      GPR.EXT'ELAB_SPEC;
      E698 := E698 + 1;
      Indent_Stack'Elab_Spec;
      E986 := E986 + 1;
      LSP.CLIENT_REQUEST_RECEIVERS'ELAB_SPEC;
      E856 := E856 + 1;
      LSP.CLIENT_RESPONSE_SENDERS'ELAB_SPEC;
      E929 := E929 + 1;
      LSP.SERVER_NOTIFICATION_RECEIVERS'ELAB_SPEC;
      E865 := E865 + 1;
      LSP.SERVER_REQUEST_RECEIVERS'ELAB_SPEC;
      E934 := E934 + 1;
      LSP.SERVER_RESPONSE_SENDERS'ELAB_SPEC;
      E922 := E922 + 1;
      E564 := E564 + 1;
      Sax.Pointers'Elab_Spec;
      Sax.Pointers'Elab_Body;
      E568 := E568 + 1;
      E782 := E782 + 1;
      Schema'Elab_Spec;
      E761 := E761 + 1;
      Spawn.Polls.Posix_Polls'Elab_Spec;
      Spawn.Polls.Posix_Polls'Elab_Body;
      E968 := E968 + 1;
      Spawn.Environments'Elab_Spec;
      Spawn.Common'Elab_Spec;
      E961 := E961 + 1;
      Spawn.Channels'Elab_Spec;
      E966 := E966 + 1;
      Spawn.Internal'Elab_Spec;
      Spawn.Channels'Elab_Body;
      E958 := E958 + 1;
      Spawn.Environments'Elab_Body;
      E943 := E943 + 1;
      Spawn.Internal.Monitor'Elab_Spec;
      Spawn.Internal.Monitor'Elab_Body;
      E947 := E947 + 1;
      E945 := E945 + 1;
      Spawn.Processes'Elab_Spec;
      E941 := E941 + 1;
      LSP.RAW_CLIENTS'ELAB_SPEC;
      LSP.RAW_CLIENTS'ELAB_BODY;
      E938 := E938 + 1;
      E988 := E988 + 1;
      Unicode.Ccs'Elab_Spec;
      E560 := E560 + 1;
      E584 := E584 + 1;
      E586 := E586 + 1;
      E591 := E591 + 1;
      E594 := E594 + 1;
      E596 := E596 + 1;
      E598 := E598 + 1;
      E603 := E603 + 1;
      Unicode.Ces'Elab_Spec;
      E556 := E556 + 1;
      Sax.Symbols'Elab_Spec;
      Sax.Symbols'Elab_Body;
      E566 := E566 + 1;
      E759 := E759 + 1;
      Sax.Exceptions'Elab_Spec;
      Sax.Exceptions'Elab_Body;
      E757 := E757 + 1;
      E558 := E558 + 1;
      E606 := E606 + 1;
      E608 := E608 + 1;
      E562 := E562 + 1;
      Sax.Models'Elab_Spec;
      E755 := E755 + 1;
      Sax.Attributes'Elab_Spec;
      Sax.Attributes'Elab_Body;
      E753 := E753 + 1;
      Sax.Utils'Elab_Spec;
      Sax.Utils'Elab_Body;
      E570 := E570 + 1;
      DOM.CORE'ELAB_SPEC;
      E545 := E545 + 1;
      Schema.Date_Time'Elab_Spec;
      E773 := E773 + 1;
      E777 := E777 + 1;
      Schema.Simple_Types'Elab_Spec;
      E771 := E771 + 1;
      E582 := E582 + 1;
      E578 := E578 + 1;
      E576 := E576 + 1;
      E765 := E765 + 1;
      E574 := E574 + 1;
      E572 := E572 + 1;
      Input_Sources'Elab_Spec;
      Input_Sources'Elab_Body;
      E745 := E745 + 1;
      Input_Sources.File'Elab_Spec;
      Input_Sources.File'Elab_Body;
      E747 := E747 + 1;
      Input_Sources.Strings'Elab_Spec;
      Input_Sources.Strings'Elab_Body;
      E751 := E751 + 1;
      Sax.Readers'Elab_Spec;
      Sax.Readers'Elab_Body;
      E749 := E749 + 1;
      Schema.Validators'Elab_Spec;
      Schema.Readers'Elab_Spec;
      Schema.Schema_Readers'Elab_Spec;
      Schema.Schema_Readers'Elab_Body;
      E769 := E769 + 1;
      Schema.Readers'Elab_Body;
      E767 := E767 + 1;
      E784 := E784 + 1;
      Schema.Validators'Elab_Body;
      E780 := E780 + 1;
      Schema.Dom_Readers'Elab_Spec;
      Schema.Dom_Readers'Elab_Body;
      E763 := E763 + 1;
      GPR.KNOWLEDGE'ELAB_SPEC;
      GPR.UTIL'ELAB_SPEC;
      GPR.COMPILATION'ELAB_SPEC;
      E730 := E730 + 1;
      GPR.ENV'ELAB_SPEC;
      GPR.ENV'ELAB_BODY;
      E658 := E658 + 1;
      GPR.JOBSERVER'ELAB_SPEC;
      GPR.JOBSERVER'ELAB_BODY;
      E700 := E700 + 1;
      GPR.KNOWLEDGE'ELAB_BODY;
      E741 := E741 + 1;
      GPR.SDEFAULT'ELAB_BODY;
      E743 := E743 + 1;
      GPR.TREE'ELAB_SPEC;
      GPR.TREE'ELAB_BODY;
      E656 := E656 + 1;
      E690 := E690 + 1;
      GPR.NMSC'ELAB_BODY;
      E682 := E682 + 1;
      GPR.PART'ELAB_BODY;
      E688 := E688 + 1;
      GPR.PROC'ELAB_BODY;
      E696 := E696 + 1;
      GPR.CONF'ELAB_SPEC;
      GPR.CONF'ELAB_BODY;
      E680 := E680 + 1;
      GPR.STRT'ELAB_BODY;
      E694 := E694 + 1;
      E786 := E786 + 1;
      Gpr_Build_Util'Elab_Spec;
      Gpr_Build_Util'Elab_Body;
      E788 := E788 + 1;
      GPR.UTIL'ELAB_BODY;
      E662 := E662 + 1;
      E792 := E792 + 1;
      GNATCOLL.PROJECTS'ELAB_SPEC;
      E616 := E616 + 1;
      GNATCOLL.PROJECTS.NORMALIZE'ELAB_SPEC;
      GNATCOLL.PROJECTS.NORMALIZE'ELAB_BODY;
      E618 := E618 + 1;
      GNATCOLL.PROJECTS'ELAB_BODY;
      E542 := E542 + 1;
      GNATCOLL.XREF'ELAB_SPEC;
      GNATCOLL.XREF.DATABASE'ELAB_SPEC;
      E819 := E819 + 1;
      GNATCOLL.XREF'ELAB_BODY;
      E540 := E540 + 1;
      Basic_Types'Elab_Spec;
      E538 := E538 + 1;
      Case_Handling'Elab_Spec;
      E533 := E533 + 1;
      Uris'Elab_Spec;
      Uris'Elab_Body;
      E387 := E387 + 1;
      Utf8_Utils'Elab_Body;
      E836 := E836 + 1;
      E521 := E521 + 1;
      Language'Elab_Spec;
      Language.Tree'Elab_Spec;
      Language.Tree'Elab_Body;
      E517 := E517 + 1;
      Language'Elab_Body;
      E508 := E508 + 1;
      Ada_Analyzer'Elab_Body;
      E983 := E983 + 1;
      Language.Ada'Elab_Spec;
      Language.Ada'Elab_Body;
      E981 := E981 + 1;
      VSS.JSON.IMPLEMENTATION.PARSERS.JSON'ELAB_SPEC;
      E891 := E891 + 1;
      VSS.JSON.PULL_READERS.LOOK_AHEAD'ELAB_SPEC;
      VSS.JSON.PULL_READERS.LOOK_AHEAD'ELAB_BODY;
      E851 := E851 + 1;
      VSS.JSON.PULL_READERS.SIMPLE'ELAB_SPEC;
      VSS.JSON.PULL_READERS.SIMPLE'ELAB_BODY;
      E886 := E886 + 1;
      VSS.JSON.PUSH_WRITERS'ELAB_SPEC;
      VSS.JSON.PUSH_WRITERS'ELAB_BODY;
      E376 := E376 + 1;
      LSP.JSON_STREAMS'ELAB_SPEC;
      LSP.JSON_STREAMS'ELAB_BODY;
      E292 := E292 + 1;
      E290 := E290 + 1;
      E385 := E385 + 1;
      E845 := E845 + 1;
      E847 := E847 + 1;
      LSP.TYPES'ELAB_SPEC;
      LSP.TYPES'ELAB_BODY;
      E273 := E273 + 1;
      GPS.LSP_CLIENT.PARTIAL_RESULTS'ELAB_SPEC;
      E878 := E878 + 1;
      E864 := E864 + 1;
      LSP.COMMANDS'ELAB_SPEC;
      LSP.COMMANDS'ELAB_BODY;
      E853 := E853 + 1;
      LSP.MESSAGES'ELAB_SPEC;
      E849 := E849 + 1;
      LSP.MESSAGES'ELAB_BODY;
      E843 := E843 + 1;
      GPS.LSP_CLIENT.TEXT_DOCUMENTS'ELAB_SPEC;
      E913 := E913 + 1;
      E270 := E270 + 1;
      LSP.CLIENT_NOTIFICATION_RECEIVERS'ELAB_SPEC;
      E855 := E855 + 1;
      LSP.CLIENT_MESSAGE_RECEIVERS'ELAB_SPEC;
      E854 := E854 + 1;
      E921 := E921 + 1;
      LSP.MESSAGES.CLIENT_RESPONSES'ELAB_SPEC;
      LSP.MESSAGES.CLIENT_RESPONSES'ELAB_BODY;
      E928 := E928 + 1;
      E862 := E862 + 1;
      E926 := E926 + 1;
      E860 := E860 + 1;
      LSP.MESSAGES.CLIENT_NOTIFICATIONS'ELAB_SPEC;
      LSP.MESSAGES.CLIENT_NOTIFICATIONS'ELAB_BODY;
      E924 := E924 + 1;
      LSP.MESSAGES.CLIENT_REQUESTS'ELAB_SPEC;
      LSP.MESSAGES.CLIENT_REQUESTS'ELAB_BODY;
      E858 := E858 + 1;
      LSP.MESSAGES.SERVER_NOTIFICATIONS'ELAB_SPEC;
      LSP.MESSAGES.SERVER_NOTIFICATIONS'ELAB_BODY;
      E931 := E931 + 1;
      LSP.MESSAGES.SERVER_REQUESTS'ELAB_SPEC;
      LSP.MESSAGES.SERVER_REQUESTS'ELAB_BODY;
      E933 := E933 + 1;
      LSP.MESSAGES.SERVER_RESPONSES'ELAB_SPEC;
      LSP.MESSAGES.SERVER_RESPONSES'ELAB_BODY;
      E919 := E919 + 1;
      VSS.TEXT_STREAMS.MEMORY_UTF8_INPUT'ELAB_SPEC;
      VSS.TEXT_STREAMS.MEMORY_UTF8_INPUT'ELAB_BODY;
      E908 := E908 + 1;
      VSS.TEXT_STREAMS.MEMORY_UTF8_OUTPUT'ELAB_SPEC;
      VSS.TEXT_STREAMS.MEMORY_UTF8_OUTPUT'ELAB_BODY;
      E910 := E910 + 1;
      LSP.CLIENTS'ELAB_SPEC;
      LSP.CLIENTS.REQUEST_HANDLERS'ELAB_SPEC;
      E916 := E916 + 1;
      LSP.CLIENTS.RESPONSE_HANDLERS'ELAB_SPEC;
      E917 := E917 + 1;
      LSP.CLIENTS'ELAB_BODY;
      E915 := E915 + 1;
      GPS.LSP_CLIENT.CALLBACKS'ELAB_SPEC;
      GPS.LSP_CLIENT.CONFIGURATIONS'ELAB_SPEC;
      GPS.LSP_CLIENT.CONFIGURATIONS'ELAB_BODY;
      E970 := E970 + 1;
      GPS.LSP_CLIENT.REQUESTS'ELAB_SPEC;
      GPS.LSP_CLIENT.REQUESTS.SHUTDOWN'ELAB_SPEC;
      GPS.LSP_CLIENT.REQUESTS.SHUTDOWN'ELAB_BODY;
      E882 := E882 + 1;
      GPS.LSP_CLIENTS'ELAB_SPEC;
      GPS.LSP_CLIENT.LANGUAGE_SERVERS'ELAB_SPEC;
      GPS.LSP_CLIENT.LANGUAGE_SERVERS'ELAB_BODY;
      E869 := E869 + 1;
      GPS.LSP_CLIENT.CALLBACKS'ELAB_BODY;
      E867 := E867 + 1;
      GPS.LSP_CLIENT.REQUESTS'ELAB_BODY;
      E871 := E871 + 1;
      GPS.LSP_CLIENTS.SHUTDOWNS'ELAB_SPEC;
      GPS.LSP_CLIENTS.SHUTDOWNS'ELAB_BODY;
      E880 := E880 + 1;
      GPS.LSP_CLIENTS'ELAB_BODY;
      E877 := E877 + 1;
      GPS.LSP_CLIENT.CONFIGURATIONS.ALS'ELAB_SPEC;
      GPS.LSP_CLIENT.CONFIGURATIONS.ALS'ELAB_BODY;
      E975 := E975 + 1;
      GPS.LSP_CLIENT.LANGUAGE_SERVERS.INTERCEPTORS'ELAB_SPEC;
      E971 := E971 + 1;
      Als_Integration_Callbacks'Elab_Spec;
      Als_Integration_Callbacks'Elab_Body;
      E266 := E266 + 1;
      E979 := E979 + 1;
      GPS.LSP_CLIENT.LANGUAGE_SERVERS.REAL'ELAB_SPEC;
      GPS.LSP_CLIENT.LANGUAGE_SERVERS.REAL'ELAB_BODY;
      E977 := E977 + 1;
      Integration_Tests'Elab_Body;
      E214 := E214 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_integration_tests_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /Users/rebecca/src/github.com/agentc1/common/obj/s-memory.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp_base/lsp.o
   --   /Users/rebecca/src/github.com/agentc1/common/obj/annotations.o
   --   /Users/rebecca/src/github.com/agentc1/common/obj/config.o
   --   /Users/rebecca/src/github.com/agentc1/common/obj/generic_stack.o
   --   /Users/rebecca/src/github.com/agentc1/common/obj/indent_stack.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-client_request_receivers.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-client_response_senders.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-server_notification_receivers.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-server_request_receivers.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-server_response_senders.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/client/lsp-raw_clients.o
   --   /Users/rebecca/src/github.com/agentc1/common/obj/basic_types.o
   --   /Users/rebecca/src/github.com/agentc1/common/obj/case_handling.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp_base/uris.o
   --   /Users/rebecca/src/github.com/agentc1/common/obj/utf8_utils.o
   --   /Users/rebecca/src/github.com/agentc1/common/obj/string_utils.o
   --   /Users/rebecca/src/github.com/agentc1/language/obj/language-tree.o
   --   /Users/rebecca/src/github.com/agentc1/language/obj/language.o
   --   /Users/rebecca/src/github.com/agentc1/language/obj/ada_analyzer.o
   --   /Users/rebecca/src/github.com/agentc1/language/obj/language-ada.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/vss-json-pull_readers-look_ahead.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp_base/lsp-json_streams.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-generic_optional.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-generic_optional_with_read_write.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-generic_sets.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-generic_vectors.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-types.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-partial_results.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-errors.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-commands.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-message_io.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-messages.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-text_documents.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-utilities.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-client_notification_receivers.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-client_message_receivers.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-generic_responses.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-messages-client_responses.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-messages-common_writers.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-generic_notifications.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-generic_requests.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-messages-client_notifications.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-messages-client_requests.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-messages-server_notifications.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-messages-server_requests.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/lsp-messages-server_responses.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/client/lsp-clients-request_handlers.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/client/lsp-clients-response_handlers.o
   --   /Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/client/lsp-clients.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-configurations.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-requests-shutdown.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-language_servers.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-callbacks.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-requests.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_clients-shutdowns.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_clients.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-configurations-als.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-language_servers-interceptors.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/tests/obj_integration/als_integration_callbacks.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-requests-internals.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/obj/gps-lsp_client-language_servers-real.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/tests/obj_integration/integration_tests.o
   --   /Users/rebecca/src/github.com/agentc1/lsp_client/tests/obj_integration/integration_tests_main.o
   --   -L/Users/rebecca/src/github.com/agentc1/lsp_client/tests/obj_integration/
   --   -L/Users/rebecca/src/github.com/agentc1/lsp_client/tests/obj_integration/
   --   -L/Users/rebecca/src/github.com/agentc1/lsp_client/obj/
   --   -L/Users/rebecca/.local/share/alire/builds/vss_25.0.0_1ddbb26c/7f4fa5516c571c416137dbb791362e70a60c8c46a476ca9a7ae76f2d93d913e9/.libs/static/
   --   -L/Users/rebecca/.local/share/alire/builds/spawn_25.0.0_c1135d5d/e1eeb8bc3c9f4b90fce999e0332e4dc3f10082dfdaa47c575a126533f8cfc75a/.libs/spawn/static/
   --   -L/Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/client/
   --   -L/Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp/
   --   -L/Users/rebecca/.local/share/alire/builds/gnatcoll_25.0.0_d7d84483/0755e84c1f44e5ae72c964e4aa6ddf658fcf1cd166b90ace417b1e8a740ea4e1/core/lib/gnatcoll_core/static/
   --   -L/Users/rebecca/.local/share/alire/builds/gnatcoll_25.0.0_d7d84483/0755e84c1f44e5ae72c964e4aa6ddf658fcf1cd166b90ace417b1e8a740ea4e1/minimal/lib/gnatcoll_core/static/
   --   -L/Users/rebecca/.local/share/alire/builds/gnatcoll_25.0.0_d7d84483/0755e84c1f44e5ae72c964e4aa6ddf658fcf1cd166b90ace417b1e8a740ea4e1/projects/lib/gnatcoll_projects/static/
   --   -L/Users/rebecca/.local/share/alire/builds/libgpr_25.0.0_17669998/dbc37f2e3fc0cb66c030e58c44a8f3ddb4790625c4fcc0334adee5e966ee0c62/gpr/lib/production/static/
   --   -L/Users/rebecca/.local/share/alire/builds/xmlada_25.0.0_7f12fe3a/57212a3faba995f6ef21b5777aa68a9e8a82f0e37e4b4f630ebe3b93f0ae4d62/unicode/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/xmlada_25.0.0_7f12fe3a/57212a3faba995f6ef21b5777aa68a9e8a82f0e37e4b4f630ebe3b93f0ae4d62/sax/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/xmlada_25.0.0_7f12fe3a/57212a3faba995f6ef21b5777aa68a9e8a82f0e37e4b4f630ebe3b93f0ae4d62/input_sources/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/xmlada_25.0.0_7f12fe3a/57212a3faba995f6ef21b5777aa68a9e8a82f0e37e4b4f630ebe3b93f0ae4d62/dom/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/xmlada_25.0.0_7f12fe3a/57212a3faba995f6ef21b5777aa68a9e8a82f0e37e4b4f630ebe3b93f0ae4d62/schema/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/ada_language_server_25.0.0_72b68d6b/141589acc873988d0fe576d07fa547a4805ee273ad74f5a36bf6f6f8d50962f3/.obj/lsp_base/
   --   -L/Users/rebecca/src/github.com/agentc1/language/obj/
   --   -L/Users/rebecca/src/github.com/agentc1/common/obj/
   --   -L/Users/rebecca/.local/share/alire/builds/gnatcoll_sqlite_25.0.0_99777a00/5650091a3a56e65ff169ebbfc044d5f0188a882c8b861430da8009eef47a7092/sqlite/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/gnatcoll_sql_25.0.0_99777a00/73fcab9ca8d322aa6fe6ca45d81faecda1258f40c6861bf9c8e6e185087fda71/sql/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/gnatcoll_xref_25.0.0_99777a00/91ea7344adc1a232489e04ae954b8acd7e025cdc952dbbb7bd253bde5d3c7482/xref/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/gnatcoll_iconv_25.0.0_0848cc59/592859e7f5155ddc717fe307df02691e79057fb1a3ac53fb26216daf336094b5/iconv/lib/static/
   --   -L/Users/rebecca/.local/share/alire/builds/aunit_25.0.0_3882c581/a08b5478e5d4f6dffbe7123e401b008ba35115b085d3c0817ded26ddb71e7e8b/lib/aunit/native-full/
   --   -L/users/rebecca/.local/share/alire/toolchains/gnat_native_15.1.2_60748c54/lib/gcc/aarch64-apple-darwin23.6.0/15.0.1/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
