*&---------------------------------------------------------------------*
*& Include z_alv_ida_cut_0631_f01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form init_2000
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM init_2000 .

  CHECK gv_ok_code IS NOT INITIAL.

  CASE gv_ok_code.
    WHEN  'GET'.

      PERFORM:  instance_cust_cont,
                          build_field_cat,
                          get_data,
                          instance_alv_scustom_data,
                          display_alv_scustom_data.

  ENDCASE.

ENDFORM.

FORM instance_cust_cont.

  go_custom_container = NEW #(  container_name = 'CONT_ALV' ).

ENDFORM.

FORM build_field_cat.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
*     i_buffer_active        =
      i_structure_name       = 'SCUSTOM'
*     i_client_never_display = 'X'
*     i_bypassing_buffer     =
*     i_internal_tabname     =
    CHANGING
      ct_fieldcat            = gt_fieldcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

ENDFORM.

FORM  instance_alv_scustom_data.

  go_alv_cus_data = NEW #( i_parent = go_custom_container ).

ENDFORM.

FORM display_alv_scustom_data.

  go_alv_cus_data->set_table_for_first_display(
*  EXPORTING
*    i_buffer_active               =
*    i_bypassing_buffer            =
*    i_consistency_check           =
*    i_structure_name              =
*    is_variant                    =
*    i_save                        =
*    i_default                     = 'X'
*    is_layout                     =
*    is_print                      =
*    it_special_groups             =
*    it_toolbar_excluding          =
*    it_hyperlink                  =
*    it_alv_graphics               =
*    it_except_qinfo               =
*    ir_salv_adapter               =
    CHANGING
      it_outtab                     = gt_scustom
      it_fieldcatalog               = gt_fieldcat
*    it_sort                       =
*    it_filter                     =
    EXCEPTIONS
      invalid_parameter_combination = 1
      program_error                 = 2
      too_many_lines                = 3
      OTHERS                        = 4
  ).
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

ENDFORM.

FORM get_data.

  CASE gv_ok_code.
    WHEN 'GET'.

      SELECT FROM scustom
        FIELDS *
        INTO TABLE @gt_scustom.

  ENDCASE.

ENDFORM.
