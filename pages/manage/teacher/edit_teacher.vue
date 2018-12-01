
<template>
    <v-card @keypress.enter="teacher_update(t_id)">
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
          แก้ไขข้อมูลครู / บุคลากร
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
              <v-card-text>ต้องการลบข้อมูลรหัส {{t_code}}<br> ใช่หรือไม่?</v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="red lighten-2" flat @click.native="conf_del = false">ไม่ใช่</v-btn>
                <v-btn color="primary" flat @click="teacher_del(t_id)">ใช่</v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-flex>
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :disabled="!isEditing"
                  maxlength="10"
                  counter
                  :rules="[rules.required, rules.counter]"
                  prepend-icon="fas fa-id-card-alt fa-2x"
                  placeholder="รหัสประจำตัวครู / บุคลากร"
                  name="t_code"
                  v-model="t_code"
                ></v-text-field>
              </v-layout>
            </v-flex>
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field 
                  :disabled="!isEditing"
                  :rules="[rules.required]"
                  prepend-icon="fas fa-user fa-2x"
                  placeholder="ชื่อ นามสกุล"
                  name="t_name"
                  v-model="t_name"
                ></v-text-field>
              </v-layout>
            </v-flex>
           
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field 
                  :disabled="!isEditing"
                  :rules="[rules.required, rules.counter]"
                  maxlength="10"
                  counter
                  prepend-icon="fas fa-phone-square fa-2x"
                  placeholder="เบอร์โทรศัพท์"
                  name="t_tel"
                  v-model="t_tel"
                ></v-text-field>
              </v-layout>
            </v-flex>
             <v-flex xs12 >
              <v-layout align-center>
                <i style="color:#757575" class="fas fa-archway fa-2x fa-2x"></i>
                <select  v-model="t_dep" class="form-control minimal padding-top-mn" placeholder="">
                  <option disabled  >{{t_dep}}</option>
                  <option v-for="dep in department" v-bind:value="dep.d_code" v-bind:key="dep.d_code">
                    {{ dep.d_name }}
                  </option>
                </select>

              </v-layout>
            </v-flex>
            <!-- <v-flex xs4>
              <select v-model="mst_1" class="form-control minimal padding-top-mn" placeholder="">
                <option disabled  >กลุ่มการเรียนที่1</option>
                <option v-for="gr in group" v-bind:value="gr.g_code" v-bind:key="gr.g_code">
                  {{ gr.g_name }}
                </option>
              </select>
            </v-flex>
            <v-flex xs4>
              <select v-model="mst_2" class="form-control minimal padding-top-mn" placeholder="">
                <option disabled  >กลุ่มการเรียนที่2</option>
                <option v-for="gr in group" v-bind:value="gr.g_code" v-bind:key="gr.g_code">
                  {{ gr.g_name }}
                </option>
              </select>
            </v-flex>
            <v-flex xs4>
              <select v-model="mst_3" class="form-control minimal padding-top-mn" placeholder="">
                <option disabled  >กลุ่มการเรียนที่3</option>
                <option v-for="gr in group" v-bind:value="gr.g_code" v-bind:key="gr.g_code">
                  {{ gr.g_name }}
                </option>
              </select>
            </v-flex> -->
           
          </v-layout>
        </v-container>
        <v-card-actions>
          
          <v-btn flat color="red lighten-2" @click="teacher()"><i class="fas fa-arrow-circle-left fa-2x"></i></v-btn>
          <v-spacer></v-spacer>
          <v-btn flat color="green lighten-2" :disabled="!isEditing" @click="teacher_update(t_id)"><i class="fas fa-save fa-2x"></i></v-btn>
        </v-card-actions>
    </v-card>
</template>
<script>
    export default {
        layout: 'manage',
        data () {
          return {
            t_id:'',
            t_code:"",
            t_name:"",
            t_dep:"",
            t_tel:"",
            t_username:"",
            t_password:"",

            mst_1: null ||'กลุ่มการเรียนที่1',
            mst_2: null ||'กลุ่มการเรียนที่2',
            mst_3: null ||"กลุ่มการเรียนที่3",

            group:[],

            d_code:"",

            type_api:"",
            danger:false,
            loading: false,
            conf_del:false,
            isEditing:null,
            alt_txt:"",

            rules: {
              required: value => !!value || 'ห้ามว่าง.',
              // counter: value => value.length <= 10 || 'เต็ม 10 ตัวอักษร',
            }
          }
        },
        async created(){
          this.sh_teacher()
          this.sh_group()
        },
        watch: {
        },
        methods:{
            conf_del(){this.conf_del=true},
            async teacher_del(t_id){
              let res=await this.$http.post('/teacher/teacher_del/',{
                t_code:this.t_code,
        				t_name:this.t_name,
        				t_dep:this.t_dep,
        				t_tel:this.t_tel,
        				t_username:this.t_username,
        				t_password:this.t_password,
                t_id:t_id,
                u_id:sessionStorage.getItem("username")
              })
              if(res.data.ok==true){this.$router.push({name:"manage-teacher"})}
              else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
            },
            async sh_teacher(){
              let res=await this.$http.get('/teacher/sh_teacher/'+this.$route.query.t_id)
              this.t_id=this.$route.query.t_id
              this.t_code=res.data.datas[0].t_code
              this.t_name=res.data.datas[0].t_name
              this.t_dep=res.data.datas[0].d_name
              this.t_tel=res.data.datas[0].t_tel
              this.t_username=res.data.datas[0].t_username
              this.t_password=res.data.datas[0].t_password
              this.d_code=res.data.datas[0].d_code
              // console.log(res.data.datas)
            
            },
            async sh_group(){
              let res=await this.$http.get('/group/list')
              // console.log(res.data.datas)
              this.group=res.data.datas
            },
            async teacher_update(t_id){
              //console.log("t_id"+t_id)
              let res=await this.$http.post("/teacher/teacher_update",{
                
        				t_code:this.t_code,
        				t_name:this.t_name,
        				t_dep:this.t_dep,
        				t_tel:this.t_tel,
        				t_username:this.t_username,
        				t_password:this.t_password,
                t_id:t_id,
                mst_1:this.mst_1,
                mst_2:this.mst_2,
                mst_3:this.mst_3,
                u_id:sessionStorage.getItem("username")
              })
              // console.log(res.data)
                if(res.data.ok==true){this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt
                  this.$router.push({name:"manage-teacher"})
                }
            	 else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
            },
            teacher(){
              this.$router.push({name:"manage-teacher"})
            }
        }
    }
</script>