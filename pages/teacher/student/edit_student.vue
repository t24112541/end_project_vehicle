
<template>
    <v-card @keypress.enter="std_update(std_id)">
      <v-alert
        v-model="danger"
        dismissible
        :type=type_api
      >
        {{alt_txt}}
      </v-alert>
        <v-card-title
          class="grey lighten-4 py-4 title"
        >
        <v-flex xs7 >
          แก้ไขข้อมูลนักเรียน / นักศึกษา
        </v-flex>
        <v-flex xs2 >
          <v-btn
            color="green lighten-2"
            flat
            @click="isEditing = !isEditing"
          >
            <i v-if="isEditing" class="fas fa-times fa-2x"></i>
            <i v-else class="fas fa-edit fa-2x "></i>
          </v-btn>
          
        </v-flex>
        <v-flex xs2 >
          <v-dialog v-model="conf_del" persistent max-width="290">
            <v-btn slot="activator" flat color="red lighten-2"><i class="fas fa-trash-alt fa-2x"></i></v-btn>
            <v-card>
              <v-card-title class="headline">ยืนยันการลบข้อมูล</v-card-title>
              <v-card-text>ต้องการลบข้อมูลรหัส {{std_code}}<br> ใช่หรือไม่?</v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="red lighten-2" flat @click.native="conf_del = false">ไม่ใช่</v-btn>
                <v-btn color="primary" flat @click="std_del(std_id)">ใช่</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-flex>
          
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <span class="headline">{{d_name}} กลุ่ม {{g_name}}</span>
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :disabled="!isEditing"
                  prepend-icon="fas fa-id-card-alt fa-2x"
                  placeholder="รหัสประจำตัวนักเรียน / นักศึกษา"
                  name="std_code"
                  v-model="std_code"
                ></v-text-field>
              </v-layout>
            </v-flex>
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :disabled="!isEditing"
                  prepend-icon="fas fa-id-card fa-2x"
                  placeholder="รหัสประจำตัวประชาชน"
                  name="std_pin_id"
                  v-model="std_pin_id"
                ></v-text-field>
              </v-layout>
            </v-flex>
          
           <v-flex xs4>
              <v-select 
                :disabled="!isEditing"
                :items="item_std_prename"
                v-model="std_prename"
                menu-props="auto"
                label="คำนำหน้าชื่อ"
                hide-details
                prepend-icon="fas fa-user"
                
                ></v-select>
            </v-flex>
            <v-flex xs4 >
                <v-text-field
                  :disabled="!isEditing"
                  prepend-icon=""
                  placeholder="ชื่อ"
                  name="std_name"
                  v-model="std_name"
                ></v-text-field>
            </v-flex>
            <v-flex xs4 >
                <v-text-field
                  :disabled="!isEditing"
                  prepend-icon=""
                  placeholder="นามสกุล"
                  name="std_lname"
                  v-model="std_lname"
                ></v-text-field>
            </v-flex>
             <v-flex xs6 >
                <v-text-field
                  prepend-icon="fas fa-phone-square"
                  :disabled="!isEditing"
                  maxlength="10"
                  counter
                  placeholder="เบอร์ติดต่อ"
                  v-model="std_tel"
                ></v-text-field>
            </v-flex>
            <v-flex xs6 >
                <v-text-field
                  prepend-icon="fas fa-phone-square"
                  :disabled="!isEditing"
                  maxlength="10"
                  counter
                  placeholder="เบอร์ติดต่อผู้ที่สามารถติดต่อได้"
                  v-model="std_tel2"
                ></v-text-field>
            </v-flex>
            <v-flex xs12>
              <v-text-field
                :disabled="!isEditing"
                prepend-icon="fas fa-birthday-cake"
                placeholder="วัน เดือน ปี เกิด เช่น 8 พฤษภาคม 2540"
                name="std_birthday"
                v-model="std_birthday"
                ></v-text-field>
            </v-flex>

            <v-flex xs6>
              <v-select
                :disabled="!isEditing"
                :items="bld"
                v-model="std_blood"
                menu-props="auto"
                hide-details
                label="กรุ๊ปเลือด"
                prepend-icon="fas fa-hospital"
              
              ></v-select>
            </v-flex>
           
          </v-layout>
        </v-container>
        <v-card-actions>
          
          
          <!-- <v-btn flat color="red lighten-2" @click="student()"><i class="fas fa-arrow-circle-left fa-2x"></i></v-btn> -->
          <v-spacer></v-spacer>
          <v-btn flat color="green lighten-2" :disabled="!isEditing" @click="std_update(std_id)"><i class="fas fa-save fa-2x"></i></v-btn>
        </v-card-actions>
        
    </v-card>
    
</template>

<script>
    export default {
        layout: 'teacher',

        data () {
          return {
            std_id:"",
            std_code:'',
            std_pin_id:"",
            std_prename:"",
            std_name:"",
            std_lname:"",
            std_birthday:"",
            std_blood: '',
            std_gender:'',
            g_code:"",
            g_name:"",
            d_name:"",
            std_tel:"",
            std_tel2:"",

            type_api:"",
            danger:false,
            alt_txt:"",
            conf_del:false,
            isEditing:null,
            bld:['A', 'B', 'O','AB'],
            gd:[{text:'ชาย',value:"ช"},{text:'หญิง',value:"ญ"}],
            item_std_prename:['นาย','นางสาว','นาง',],
            modal: false,
            date: null,

            menu1: false,
          }
        },
        async created(){
          this.sh_std()
        },
        watch:{
          std_prename(newValue){
            if(newValue=="นาย"){this.std_gender="ช"}else{this.std_gender="ญ"}
          },
        },
        methods:{
            conf_del(){this.conf_del=true},
            async std_del(std_id){
              let res=await this.$http.post('/student/std_del/',{
                std_code:this.std_code,
        				std_pin_id:this.std_pin_id,
        				std_prename:this.std_prename,
        				std_name:this.std_name,
        				std_lname:this.std_lname,
        				std_birthday:this.std_birthday,
        				std_gender:this.std_gender,
        				std_blood:this.std_blood,
        				g_code:this.g_code,
                std_id:std_id,
                std_tel:this.std_tel,
                std_tel2:this.std_tel2,
                u_id:sessionStorage.getItem("username")
              })
              if(res.data.ok==true){
                this.conf_del=false
                this.$router.push({name:"teacher-group"})
              }
              else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
            },
            async sh_std(){
              let res=await this.$http.get('/student/sh_std/'+this.$route.query.std_id)
              this.std_id=this.$route.query.std_id
              this.std=res.data.datas
              this.std_code=res.data.datas.std_code
              this.std_pin_id=res.data.datas.std_pin_id
              this.std_prename=res.data.datas.std_prename
              this.std_name=res.data.datas.std_name
              this.std_lname=res.data.datas.std_lname
              this.std_birthday=res.data.datas.std_birthday
              this.std_gender=res.data.datas.std_gender
              this.std_blood=res.data.datas.std_blood
              this.g_code=res.data.datas.g_code
              this.g_name=res.data.datas.g_name
              this.d_name=res.data.datas.d_name
              this.std_tel=res.data.datas.std_tel
              this.std_tel2=res.data.datas.std_tel2
              // console.log(res.data)
            },
            async std_update(std_id){
              //console.log("std_id"+std_id)
              let res=await this.$http.post("/student/std_update",{
                
        				std_code:this.std_code,
        				std_pin_id:this.std_pin_id,
        				std_prename:this.std_prename,
        				std_name:this.std_name,
        				std_lname:this.std_lname,
        				std_birthday:this.std_birthday,
        				std_gender:this.std_gender,
        				std_blood:this.std_blood,
        				g_code:this.g_code,
                std_id:std_id,
                std_tel:this.std_tel,
                std_tel2:this.std_tel2,
                u_id:sessionStorage.getItem("username")
              })
              console.log(res.data)
                if(res.data.ok==true){this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt
                  this.$router.push({name:"teacher-group"})
                }
            	 else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
            },
            student(){
              this.$router.push({name:"teacher-student"})
            },
          
        },
       
    }
</script>