<template>
  <div>
    <v-card>
    <div class="cv_header padding-top-mn" >ข้อมูลยานพาหนะ</div>
    <div class="cv_header padding-top-mn"> 
      <v-text-field
              label="ค้นหาพาหนะ"
              append-icon="search"
              v-model="txt_search"
            ></v-text-field>
    </div> 
    <div class="cv_header xs12">
      <v-btn
        color="green lighten-2"
        dark
        small
        absolute
        top
        right
        fab
        @click="machine_add()"
      >
        <v-icon>add</v-icon>
      </v-btn>
    </div>
    <v-spacer></v-spacer>
    <v-spacer></v-spacer>
  <v-data-table
      :headers="headers"
      :items="std"
      :search="search"

      :loading=state
      class="elevation-1"
      prev-icon="fas fa-chevron-circle-left"
      next-icon="fas fa-chevron-circle-right"
      sort-icon="mdi-menu-down"
      rows-per-page-text="แสดง"
      :rows-per-page-items=rows_per_page
      
    >
    <template slot="headerCell" slot-scope="props">
      <v-tooltip bottom>
        <span slot="activator">
          {{ props.header.text }}
        </span>
        <span>
          {{ props.header.text }}
        </span>
      </v-tooltip>
    </template>
    <template slot="items" slot-scope="props" >
      <tr v-on:click="list_machine(props.item.mc_id)">
        <td class="text-xs-left xs10">{{ props.item.mc_code }}</td>
        <td class="text-xs-left">{{ props.item.mc_brand }}</td>
        <td class="text-xs-left">{{ props.item.mc_series }}</td>
      </tr>
    </template>
      <template slot="no-data">
        <v-alert :value="true" color="error" icon="warning">
          ไม่พบข้อมูล :(
        </v-alert>
      </template>
  </v-data-table>
    </v-card>
  </div>
</template>

<script>
  export default {
    layout: 'manage',
    data () {
      return {
        txt_search:"",
        state:true,
        search: '',
        rows_per_page:[10,20,{"text":"แสดงทั้งหมด","value":-1}],//////////////////////////   teach me pleas!
        headers: [
          {text: 'ทะเบียนรถ',align: 'left',sortable: false, value: 'ทะเบียนรถ'},
          { text: 'แบรนด์รถ', value: 'แบรนด์รถ',align: 'left', sortable: false,},
          { text: 'รุ่นรถ', value: 'รุ่นรถ',align: 'left',sortable: false,  },
        ],
        std:[]
      }
    },
     watch:{
      async txt_search(newValue){
        let s=newValue
        this.state=true
        let res=await this.$http.post('/machine/search',{
          txt_search:s
        })
        console.log(res.data)
        this.std=res.data.datas
        this.state=false
      }
    },
    async created(){
      if(this.$route.query.g_code){
        let res=await this.$http.get('/machine/list_g/'+this.$route.query.g_code)
        this.std=res.data.datas
        this.state=false
      }else{
        let res=await this.$http.get('/machine/list')
        this.std=res.data.datas
        this.state=false
      }
      
      
    },
    computed: {
    },
    methods:{
      list_machine(mc_id){
        this.$router.push({path: '../manage/machines/edit_machine?mc_id='+mc_id})
      },
     machine_add(){
        this.$router.push({path:"../manage/machines/data_add_machine"})
      }
    }
  }
</script>