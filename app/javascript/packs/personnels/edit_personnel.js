gon.names.forEach((value, index) => {

  // 要素を選択して反映
  $("#work_personnels_attributes_" + index +"_company_name option[value='" + value + "']").prop("selected", true);
});