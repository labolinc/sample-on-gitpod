<script setup lang="ts">

const { $httpClient } = useNuxtApp()
const router = useRouter();
const user = reactive({
  userId: null,
  name: "",
  email: "",
});

const getUser = () => {
  $httpClient.get("/sample-authenticated/user")
      .then((res) => {
        user.userId = res.data.userId;
        user.name = res.data.name;
        user.email = res.data.email;

        userUpdatingForm.name = res.data.name;
        userUpdatingForm.email = res.data.email;
      })
      .catch((_) => {
        router.push("/login");
      });
}
getUser()

const logout = () => {
  $httpClient.get("/logout");
  router.push("/");
};

const userCreationForm = reactive({
  name: "",
  email: "",
  password: "",
});
const addUser = () => {
  $httpClient.post("/sample-authenticated/user", userCreationForm).then((_)=> {
    userCreationForm.name = ""
    userCreationForm.email = ""
    userCreationForm.password = ""
  });
};

const userUpdatingForm = reactive({
  name: "",
  email: "",
  password: "",
});
const updateUser = () => {
  $httpClient.put("/sample-authenticated/user", userUpdatingForm)
    .then((_) => getUser());
};

const deleteUser = () => {
  $httpClient.delete("/sample-authenticated/user")
  .then((_) => {
    logout();
    router.push("/");
  });
};
</script>

<template>
  <h1>MyPage</h1>

  <div>
    <div>userId: {{ user.userId }}</div>
    <div>name: {{ user.name }}</div>
    <div>email: {{ user.email }}</div>

    <div>
      <button @click="logout()">logout</button>
    </div>
  </div>

  <hr/>
  <div>
    <h2>Add User</h2>
    <div>
      <div>name: <input type="text" v-model="userCreationForm.name"/></div>
      <div>email: <input type="email" v-model="userCreationForm.email"/></div>
      <div>
        password: <input type="password" v-model="userCreationForm.password"/>
      </div>
      <button @click="addUser()">add</button>
    </div>
  </div>

  <hr/>
  <div>
    <h2>Update User</h2>
    <div>
      <div>name: <input type="text" v-model="userUpdatingForm.name"/></div>
      <div>email: <input type="email" v-model="userUpdatingForm.email"/></div>
      <div>
        password: <input type="password" v-model="userUpdatingForm.password"/>
      </div>
      <button @click="updateUser()">update</button>
    </div>
  </div>

  <hr/>
  <div>
    <h2>Delete User</h2>
    <button @click="deleteUser()">delete me</button>
  </div>
</template>
