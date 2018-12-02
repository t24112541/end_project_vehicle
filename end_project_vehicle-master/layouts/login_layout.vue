<template>
 <div id="app">
  <v-app id="inspire" class="grey lighten-4">
    <v-content>
      <v-container >
        <v-layout align-center justify-center>
          <v-flex xs12 sm8 md4>
            <v-card class="elevation-12" color="grey lighten-4">
              <v-card-text>
                <center><img :src="require('@/static/image/icon.png')" class="icon_login"></center>
                <v-toolbar-title style="text-align:center"><h3>เข้าสู่ระบบ</h3></v-toolbar-title>
                <v-form>
                  <v-text-field prepend-icon="person" name="username" label="Username" type="text"></v-text-field>
                  <v-text-field prepend-icon="lock" name="password" label="Password" id="password" type="password"></v-text-field>
                </v-form>
              </v-card-text>
              <v-card-actions>
                <v-flex xs12 sm12 md12 style="text-align:center">
                 <v-btn @click="login" color="primary" block>เข้าสู่ระบบ</v-btn>
                 <!--<br>
                 <v-btn @click="submit" color="error" block>Google +</v-btn>-->
                <br>
                 <v-btn @click="regist" color="success" block>สมัครใช้งาน</v-btn>
                 </v-flex>
              </v-card-actions>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</div>
</template>
<script>
export default {
  method:{
    login(){this.$router.replace("/machines/")},
    regist(){}
  },
}
</script>

