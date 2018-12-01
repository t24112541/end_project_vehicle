
<template>
    <v-card @keypress.enter="teacher_add()">
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
          เพิ่มข้อมูลครู / บุคลากร
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :rules="[rules.required, rules.counter]"
                  maxlength="10"
                  counter
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
                  :rules="[rules.required]"
                  maxlength="50"
                  counter
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
                  <option disabled  >แผนกวิชา</option>
                  <option v-for="dep in department" v-bind:value="dep.d_code" v-bind:key="dep.d_code">
                    {{ dep.d_name }}
                  </option>
                </select>

              </v-layout>
            </v-flex>
            <v-flex xs4 >
              <select  v-model="mst_1" class="form-control minimal padding-top-mn" placeholder="">
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
            </v-flex>
          </v-layout>
        </v-container>
        <v-card-actions>
          
          <v-btn flat color="red lighten-2" @click="teacher()"><i class="fas fa-arrow-circle-left fa-2x"></i></v-btn>
          <v-spacer></v-spacer>
          <v-btn flat color="green lighten-2" @click="teacher_add()"><i class="fas fa-save fa-2x"></i></v-btn>
        </v-card-actions>
    </v-card>
</template>

<script>
    export default {
        layout: 'manage',
        data () {
            return {
              t_code:"",
              t_name:"",
              t_dep:"แผนกวิชา",
              t_tel:"",

              mst_1: null ||'กลุ่มการเรียนที่1',
              mst_2: null ||'กลุ่มการเรียนที่2',
              mst_3: null ||"กลุ่มการเรียนที่3",
              department:[],

              type_api:"",
              danger:false,
              loading: false,
              items: [],
              sh_gro1: null,
              sh_gro2: null,
              sh_gro3: null,
              group: [],
              rules: {
                required: value => !!value || 'ห้ามว่าง.',
                // counter: value => value.length <= 10 || 'เต็ม 10 ตัวอักษร',
              }
          
          }
    
        },
        watch: {
          async t_dep(newValue){
            let res=await this.$http.post('/group/cus_select',{t_dep:newValue})
            // console.log(res.data.datas)
            this.group=res.data.datas
          },
          //  std_prename(newValue){
          //   if(newValue=="นาย"){this.std_gender="ช"}else{this.std_gender="ญ"}
          // },
        },
        async created(){
          let res=await this.$http.get('/group/list')
          // console.log(res.data.datas)
          this.group=res.data.datas
          let res2=await this.$http.get('/department/list')
            // console.log(res.data.datas)
          this.department=res2.data.datas
        },
        methods: {
          async department(){
           
          },
          querySelections (v) {
            this.loading = true
            setTimeout(() => {
              // this.items = this.group.filter(e => {
              //   return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
              // })
              return this.group.filter(e => e.class + '' === this.sh_gro1)
              this.loading = false
            }, 500)
          },
          async teacher_add(){
            if(this.t_code!='' && this.t_name!='' && this.t_dep!='' && this.t_tel!='' ){
              let res=await this.$http.post("teacher/teacher_add",{
                t_code:this.t_code,
                t_name:this.t_name,
                t_dep:this.t_dep,
                t_tel:this.t_tel,
                mst_1:this.mst_1,
                mst_2:this.mst_2,
                mst_3:this.mst_3,
                u_id:sessionStorage.getItem("username")
              })
              if(res.data.ok==true){this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt
                this.$router.push({name:"manage-teacher"})
              }
              else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
            }else{this.danger=true,this.alt_txt="กรุณากรอกข้อมูลให้ครบ",this.type_api="error"}
          },
          teacher(){
              this.$router.push({name:"manage-teacher"})
            }
        }
    }
</script>