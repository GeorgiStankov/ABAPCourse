CLASS zcl_dfv_abap_course_georgi DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    INTERFACES zif_abap_course_basics .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dfv_abap_course_georgi IMPLEMENTATION.


  METHOD zif_abap_course_basics~calculator.
    CASE iv_operator.
      WHEN '+'.
        rv_result = iv_first_number + iv_second_number.
      WHEN '-'.
        rv_result = iv_first_number - iv_second_number.
      WHEN '*'.
        rv_result = iv_first_number * iv_second_number.
      WHEN '/'.
        IF iv_second_number <> 0.
          rv_result = iv_first_number / iv_second_number.
        ENDIF.
    ENDCASE.
  ENDMETHOD.


  METHOD zif_abap_course_basics~date_parsing.
  ENDMETHOD.


  METHOD zif_abap_course_basics~fizz_buzz.
    DATA: lv_counter     TYPE i,
          lv_counter_str TYPE string.

    DO 100 TIMES.
      lv_counter = sy-index.

      IF lv_counter MOD 15 = 0.
        CONCATENATE rv_result 'FizzBuzz' INTO rv_result SEPARATED BY space.
      ELSEIF lv_counter MOD 3 = 0.
        CONCATENATE rv_result 'Fizz' INTO rv_result SEPARATED BY space.
      ELSEIF lv_counter MOD 5 = 0.
        CONCATENATE rv_result 'Buzz' INTO rv_result SEPARATED BY space.
      ELSE.
        lv_counter_str = lv_counter.
        CONCATENATE rv_result lv_counter_str INTO rv_result SEPARATED BY space.
      ENDIF.
    ENDDO.
  ENDMETHOD.


  METHOD zif_abap_course_basics~get_current_date_time.
  ENDMETHOD.


  METHOD zif_abap_course_basics~hello_world.
    DATA(lv_session_user) = sy-uname.

    rv_result = |Hello { iv_name }, your user ID is { lv_session_user }.|.
  ENDMETHOD.


  METHOD zif_abap_course_basics~internal_tables.
  ENDMETHOD.


  METHOD zif_abap_course_basics~open_sql.
  ENDMETHOD.


  METHOD zif_abap_course_basics~scrabble_score.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    DATA(result) = zif_abap_course_basics~date_parsing( | 12 4 2017 | ).
    out->write( result ).
  ENDMETHOD.

ENDCLASS.
