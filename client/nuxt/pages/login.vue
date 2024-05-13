<script setup lang="ts">

const { $httpClient } = useNuxtApp()

const router = useRouter()

const inputForm = reactive({
  email: "labol@example.com",
  password: "password",
})

const login = () => {
  const params = new URLSearchParams();
  params.append("username", inputForm.email)
  params.append("password", inputForm.password)

  $httpClient.post('/api/login', params).then((_) => {
    router.push('/mypage')
  })
}

</script>
<template>
  <h1>Login</h1>
  <div>
    <input type="email" v-model="inputForm.email">
    <input type="password" v-model="inputForm.password">
    <button @click="login()">login</button>
  </div>
</template>