<template>
  <div id="app">
  <v-app id="inspire">
   <v-toolbar color="light-green darken-2"  dark tabs>
        <v-icon>fas fa-th</v-icon>
  
        <v-toolbar-title>CTC Parking</v-toolbar-title>
  
        <v-spacer></v-spacer>
  
        <v-btn icon>
          <v-icon>fas fa-search</v-icon>
        </v-btn>
  
        <v-btn icon>
          <v-icon>fas fa-cog</v-icon>
        </v-btn>
      </v-toolbar>
      <v-tabs
      centered
      color="light-green darken-1"
      dark
      icons-and-text
    >
      <v-tabs-slider color="yellow"></v-tabs-slider>
  
      <v-tab href="#tab-1">
        หน้าหลัก
        <v-icon>fas fa-home</v-icon>
      </v-tab>
  
      <v-tab href="#tab-2">
        ข้อมูลรถ
        <v-icon>fas fa-edit</v-icon>
      </v-tab>
  
      <v-tab href="#tab-3">
        ข้อมูลส่วนตัว
        <v-icon>fas fa-user-tie</v-icon>
      </v-tab>

      <v-tab href="#tab-4">
        สอบถาม
        <v-icon>fas fa-comments</v-icon>
      </v-tab>

    </v-tabs>
     <v-content>
      <nuxt/>
    </v-content>
    <v-footer>
      <v-layout justify-center row wrap>
        <v-flex light-green darken-2 py-3 text-xs-center white--text xs12>
          &copy;CTC Parking — <strong>2018</strong>
        </v-flex>
      </v-layout>
    </v-footer>
  </v-app>
</div>
</template>