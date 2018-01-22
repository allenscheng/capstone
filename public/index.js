/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      walProducts: [],
      userProducts: [],
      products: [],
      product_link: ""
    };
  },
  created: function() {
    axios.get("/deals").then(
      function(response) {
        this.walProducts = response.data[0];
        this.userProducts = response.data[1];
        this.products = this.userProducts.concat(this.walProducts);
      }.bind(this)
    );
  },
  methods: {
    addWishlist: function(link) {
      var params = {
        product_link: link
      };
      axios
        .post("/lists", params)
        .then(function(response) {
          router.push("/lists");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// var CreateDailyDealPage = {
//   template: "#create-dailydeal-page",
//   data: function() {
//     return {
//       name: "",
//       price: "",
//       color: "",
//       description: "",
//       productLink: "",
//       errors: []
//     };
//   },
//   methods: {
//     submit: function() {
//       var params = {
//         name: this.name,
//         msrp: this.price,
//         color: this.color,
//         description: this.description,
//         product_link: this.productLink
//       };
//       axios
//         .post("/deals", params)
//         .then(function(response) {
//           router.push("/");
//         })
//         .catch(
//           function(error) {
//             this.errors = error.response.data.errors;
//           }.bind(this)
//         );
//     }
//   }
// };

var CreateDailyDealPageWithURL = {
  template: "#create-dailydealurl-page",
  data: function() {
    return {
      name: "",
      price: "",
      color: "",
      description: "",
      productLink: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        msrp: this.price,
        color: this.color,
        description: this.description,
        product_link: this.productLink
      };
      axios
        .post("/dealsurl", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var CreateWishListPage = {
  template: "#create-wishlist-page",
  data: function() {
    return {
      // name: "",
      productLink: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        product_link: this.productLink
      };
      axios
        .post("/lists", params)
        .then(function(response) {
          router.push("/lists");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ViewWishListPage = {
  template: "#view-wishlist-page",
  data: function() {
    return {
      wishlists: []
    };
  },
  created: function() {
    axios.get("/lists").then(
      function(response) {
        this.wishlists = response.data;
      }.bind(this)
    );
  },
  methods: {},
  computed: {}
};

var ViewDailyDealPage = {
  template: "#view-dailydeal-page",
  data: function() {
    return {
      dailydeals: []
    };
  },
  created: function() {
    axios.get("/deals2").then(
      function(response) {
        this.dailydeals = response.data;
      }.bind(this)
    );
  },
  methods: {},
  computed: {}
};

var SearchPage = {
  template: "#search-results-page",
  data: function() {
    return {
      searchResults: this.$root.searchresults,
      search_term: ""
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SubmitImagePage = {
  template: "#submit-image-page",
  data: function() {
    return {
      productLink: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        product_link: this.productLink
      };
      axios
        .post("/images", params)
        .then(function(response) {
          router.push("/imageResults");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ImageResultPage = {
  template: "#image-result-page",
  data: function() {
    return {
      results: []
    };
  },
  created: function() {
    axios.get("/images").then(
      function(response) {
        this.results = response.data;
      }.bind(this)
    );
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/login", component: LoginPage },
    { path: "/signup", component: SignupPage },
    // { path: "/dailydeal", component: CreateDailyDealPage },
    { path: "/dailydealurl", component: CreateDailyDealPageWithURL },
    { path: "/wishlist", component: CreateWishListPage },
    { path: "/lists", component: ViewWishListPage },
    { path: "/deals", component: ViewDailyDealPage },
    { path: "/searchresults", component: SearchPage },
    { path: "/submitimage", component: SubmitImagePage },
    { path: "/imageResult", component: ImageResultPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  data: function() {
    return {
      searchresults: [],
      search_term: ""
    };
  },
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  },
  methods: {
    submit: function() {
      // console.log(this.search_term);
      axios.get("/deals_search?search_term=" + this.search_term).then(
        function(response) {
          this.searchresults = response.data;
          // console.log(this.searchresults);
          router.push("/searchresults");
          this.search_term = "";
        }.bind(this)
      );
    }
  }
});
