*&---------------------------------------------------------------------*
*& Include Z_ALV_IDA_CUT_0631_TOP                   - Module Pool      Z_ALV_IDA_CUT_0631
*&---------------------------------------------------------------------*
PROGRAM z_alv_ida_cut_0631.

DATA gv_ok_code TYPE syucomm.

"custom container
DATA go_custom_container TYPE REF TO cl_gui_custom_container.

"ALV grid
DATA go_alv_cus_data TYPE REF TO cl_gui_alv_grid.

"field catalog
DATA gt_fieldcat TYPE lvc_t_fcat.

"scustom data
DATA gt_scustom TYPE TABLE OF scustom.
