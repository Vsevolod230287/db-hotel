var app = new Vue({
  el: "#root",
  data: {
     stanze: [],
     stanza: {},
  },
  mounted() {
    axios
      .get("http://localhost/PHP/db-hotel/db_php_api/api/stanze.php")
      .then((response) => {
        console.log(response.data.response);
        this.stanze = response.data.response;
      })
  },
  methods: {
    getById: function(id){
      axios
        .get("http://localhost/PHP/db-hotel/db_php_api/api/stanze.php?id="+id)
        .then((response) => {
          console.log(response.data.response[0]);
          this.stanza = response.data.response[0];
        })
    }

  }

});
