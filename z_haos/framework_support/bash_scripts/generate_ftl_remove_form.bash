# echo $scripted_framework_output_root_directory

function display_file_creation_location_vars(){
    printf "CREATING FILE : %s\n" $ftl_files_output_directory_and_file_name
}

function add_header_to_ftl_file(){

cat  << EOT > $ftl_files_output_directory_and_file_name
<h2>Create $java_class_name</h2>
   <p id="status"></p>
  <form action="" method="POST" role="form">
EOT
# Do not indent this line above here!
}

function add_attribute_set_form_field_to_ftl_file(){

case "$atribute_type" in

    "String" )
    cat  << EOT >> $ftl_files_output_directory_and_file_name

    <div class="form-group">
      <label for="$atribute_name">$atribute_text_for_label</label>
      <input type="text" class="form-control" id="$atribute_name" name="$atribute_name" placeholder="$atribute_text_for_placeholder">
    </div>
EOT
# Do not indent this line above here!
    ;;    

    "int" )
    cat  << EOT >> $ftl_files_output_directory_and_file_name

    <div class="form-group">
      <label for="$atribute_name">$atribute_text_for_label</label>
      <input type="number" class="form-control" id="$atribute_name" name="$atribute_name">
    </div>
EOT
    ;;

    "char" )
    cat  << EOT >> $ftl_files_output_directory_and_file_name

    <div class="form-group">
      <label for="$atribute_name">$atribute_text_for_label</label>
      <select class="form-control" id="$atribute_name" name="$atribute_name">
EOT
#atribute_text_for_placeholder
    char_array=()
    for (( char_index=0 ; char_index < ${#atribute_text_for_placeholder} ; char_index++ )); do 
        char_array[char_index]=${atribute_text_for_placeholder:char_index:1};
        cat  << EOT >> $ftl_files_output_directory_and_file_name
        <option value="${char_array[char_index]}">${char_array[char_index]}</option>
EOT
    done

    cat  << EOT >> $ftl_files_output_directory_and_file_name
      </select>
    </div>
EOT
    ;;
    "long" )
    cat  << EOT >> $ftl_files_output_directory_and_file_name

    <div class="form-group">
      <label for="$atribute_name">$atribute_text_for_label</label>
      <input type="number" class="form-control" id="$atribute_name" name="$atribute_name">
    </div>
EOT
    ;;

    * )
    cat  << EOT >> $ftl_files_output_directory_and_file_name

    <div class="form-group">
      <label for="$atribute_name">$atribute_text_for_label</label>
      <input type="text" class="form-control" id="$atribute_name" name="$atribute_name" placeholder="$atribute_text_for_placeholder">
    </div>
EOT
# Do not indent this line above here!
    ;;
    esac
}

function add_footer_to_ftl_file(){
cat  << EOT >> $ftl_files_output_directory_and_file_name

    <button type="submit" class="btn btn-default">Submit</button>
  </form>


<!-- Simple JS Function to convert the data into JSON and Pass it as ajax Call --!>
<script>
\$(function() {
    \$('form').submit(function(e) {
        e.preventDefault();
        var this_ = \$(this);
        var array = this_.serializeArray();
        var json = {};
    
        \$.each(array, function() {
            json[this.name] = this.value || '';
        });
        json = JSON.stringify(json);
    
        // Ajax Call
        \$.ajax({
            type: "POST",
            url: "create$java_class_name",
            data: json,
            dataType: "json",
            success : function() {
                \$("#status").text("$java_class_name SuccesFully Added");
                this_.find('input,select').val('');
            },
            error : function(e) {
                console.log(e.responseText);
                \$("#status").text(e.responseText);
            }
        });
        \$("html, body").animate({ scrollTop: 0 }, "slow");
        return false;
    });
});

</script>
EOT
# Do not indent this line above here!
}

function write_remove_ftl_file(){

cat << EOT > $ftl_files_output_directory_and_file_name
<div class="starter-template">
	<h2> Remove User </h2>
    	<p id="status"></p>
  	<div class="form-group">
      		<label for="id">Select Id to Remove</label>
      		<select id="users" name="userid"></select>
    	</div>
      <button type="submit" class="btn btn-default">Submit</button>
      <p id="status"></p>
</div>	

<script>
\$( document ).ready(function() {
      var user = \${users};
      var sel = \$('#users');
      \$.each(user, function(key,val){
        sel.append('<option value="' + val + '">' + val + '</option>');   
      });
      \$("button").on("click", function(e) {
      	e.preventDefault();
        var this_ = \$(this);
        var arr = \$("#users").val();
        // Ajax Call
        \$.ajax({
            type: "PUT",
            url: 'removeUser/' + arr,
            success : function(e) {
                \$("#users option:selected").remove();
                \$("#status").text(e);
            },
            error : function(e) {
                \$("#status").text(e);
            }
        });
        return false;
    });
});
	
</script>
EOT
}

function create_remove_ftl_file(){
    # Make sure there is a directory to put the files in.
    mkdir -p $ftl_file_output_directory
    
    local create_file_name="remove"$java_class_name"Form.ftl"
    
    ftl_files_output_directory_and_file_name="$ftl_file_output_directory/$create_file_name"
    display_file_creation_location_vars
    write_remove_ftl_file
: << 'EOJ'

    add_header_to_ftl_file
    
    for ((attribute_array_index=0;attribute_array_index<${#java_class_attribute_array[@]};attribute_array_index++)); do
        create_attribute_array_split
        add_attribute_set_form_field_to_ftl_file
    done        
    
    add_footer_to_ftl_file
EOJ

}

#mkdir -p $java_files_output_directory_name
#add_header_to_java_file