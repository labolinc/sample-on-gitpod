<script setup lang="ts">

const { $httpClient } = useNuxtApp()

type UserType = {
  userId: number;
  name: string;
  email: string;
};
const users = ref<UserType[]>([]);


$httpClient.get("/sample/users")
  .then((res) => {
    users.value = res.data;
  })
  .catch((_) => {});

</script>
<template>
  <div>
    <h1>Top</h1>
    <div>
      <ul>
        <li v-for="user in users">
          {{ user.userId }}/{{ user.name }}/{{ user.email }}
        </li>
      </ul>
    </div>
  </div>
</template>
