// Update the login button state based on input length
function updateLoginButtonState() {
  var username = $("#username").val();
  var password = $("#password").val();
  
  var usernameValid = username.length >=2  ;
  var passwordValid = password.length  >=2 ;
  
  // Enable or disable the login button based on input validity
  $("input[name='btnSubmit']").prop("disabled", !(usernameValid && passwordValid));
}

$(document).ready(function() {
  // Initial button state on page load
  updateLoginButtonState();

  // Validate username and password on keyup
  $("#username").keyup(function() {
    var username = $(this).val();

    if (username.length < 2) {
      $("#username-error").text("Username must have at least 2 characters");
    } else {
      $("#username-error").text("");
    }

    // Update login button state
    updateLoginButtonState();
  });

  $("#password").keyup(function() {
    var password = $(this).val();

    if (password.length < 2) {
      $("#password-error").text("Password must have at least 2 characters");
    } else {
      $("#password-error").text("");
    }

    // Update login button state
    updateLoginButtonState();
  });

  // Prevent form submission if the login button is disabled
  $("#loginForm").submit(function(event) {
    if ($("input[name='btnSubmit']").prop("disabled")) {
      event.preventDefault();
      alert("Please enter valid username and password.");
    }
  });
});
