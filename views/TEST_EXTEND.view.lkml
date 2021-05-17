include: "/views/global_parameters.view.lkml"
view: test_extend {
extends: [global_parameters]

measure: testje {
  type:  sum
  sql: 1 ;;
}

}
