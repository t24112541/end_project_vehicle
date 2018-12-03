
<template>
    <v-card>
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
          เพิ่มข้อมูลอุปกรณ์
          <v-spacer></v-spacer>
        </v-card-title>
        <v-container grid-list-sm class="pa-4">
          <v-layout row wrap>
            <!-- <v-flex xs12>
              <p>ตำแหน่งเจ้าของอุปกรณ์ {{ position || '' }}</p>
              <v-radio-group v-model="ac_u_table" :mandatory="false" row>
                <v-radio label="ครู / บุคลากร" color="success" value="pk_teacher"></v-radio>
                <v-radio label="นักเรียน / นักศึกษา" color="success" value="pk_student"></v-radio>
              </v-radio-group>
            </v-flex> -->
            <!-- <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :rules="[rules.required]"
                  maxlength="10"
                  counter
                  placeholder="รหัสประจำตัวเจ้าของอุปกรณ์"
                  label="เจ้าของอุปกรณ์"
                  prepend-icon="fas fa-car"
                  name="ac_u_id"
                  v-model="ac_u_id"
                ></v-text-field>
              </v-layout>
            </v-flex> -->
            <v-flex xs12 >
              <v-layout align-center>
                <v-text-field
                  :rules="[rules.required]"
                  counter
                  prepend-icon="fas fa-newspaper"
                  label="ชื่อุปกรณ์"
                  placeholder="ชื่อุปกรณ์"
                  name="ac_name"
                  v-model="ac_name"
                ></v-text-field>
              </v-layout>
            </v-flex>
            <v-flex xs12 >
              <v-layout align-center>
                <v-textarea
                  :rules="[rules.required]"
                  solo
                  label="รายละเอียด"
                  v-model="ac_description"
                  prepend-icon="fas fa-id-card-alt fa-2x"
                  placeholder="รายละเอียด"
                ></v-textarea>
              </v-layout>
            </v-flex>
            <!-- image zone -->
            
              <v-flex xs4
                @click="$refs.img_font.click()" 
                style="cursor: pointer;"
              >
                <input 
                  type="file" 
                  style="display:none;" 
                  accept="image/*" 
                  multiple  
                  @change="upload_img_font($event)" 
                  ref="img_font"
                >
                <v-card height="100%" class="grey lighten-4 paddign"> 
                  <img :src="this.img_font" width="100%" >
                  <v-card-actions style="font-size:100%">
                    <span><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span>รูปด้านหน้า</span>
                  </v-card-actions>
                </v-card>
              </v-flex>
              <!-- end 1 -->

              <v-flex xs4 class="text-xs-center" 
                @click="$refs.img_side.click()" 
                style="cursor: pointer;"
              >
                <input 
                  type="file" 
                  style="display:none;" 
                  accept="image/*" 
                  multiple  
                  @change="upload_img_side($event)" 
                  ref="img_side"
                >
                <v-card height="100%" class="grey lighten-4 paddign" > 
                  <img :src="this.img_side" width="100%">
                  <v-card-actions style="font-size:100%">
                    <span><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span>รูปด้านข้าง</span>
                  </v-card-actions>
                </v-card>
              </v-flex>
              <!-- end 2 -->
              <v-flex xs4 class="text-xs-center" 
                @click="$refs.img_rear.click()" 
                style="cursor: pointer;"
              >
                <input 
                  type="file" 
                  style="display:none;" 
                  accept="image/*" 
                  multiple  
                  @change="upload_img_rear($event)" 
                  ref="img_rear"
                >
                <v-card height="100%" class="grey lighten-4 paddign" > 
                  <img :src="this.img_rear" width="100%">
                  <v-card-actions style="font-size:100%">
                    <span><i class="fas fa-image fa-2x"></i></span>
                    <v-spacer></v-spacer>
                    <span>รูปด้านหลัง</span>
                  </v-card-actions>
                </v-card>
              </v-flex>
              
  
           

          </v-layout>
        </v-container>
        <v-card-actions>
          <v-btn flat color="red lighten-2" @click="accessories()"><i class="fas fa-arrow-circle-left fa-2x"></i></v-btn>
          <v-spacer></v-spacer>
          <v-btn flat color="green lighten-2"  @click="accessories_add()"><i class="fas fa-save fa-2x"></i></v-btn>
        </v-card-actions>
    </v-card>
</template>

<style>
   .uploading-image{
     display:flex;
   }
 </style>
<script>
    export default {
        layout: 'student',
        data () {
            return {
              previewImage:[],
              img_font:[],
              img_side:[],
              img_rear:[],
              ac_description:"",
              ac_u_id:"",
              ac_name: '',
              ac_u_table:"",

              position:"",

              type_api:"",
              danger:false,
              conf_del:false,
              isEditing:null,
              rules: {
                    required: value => !!value || 'ห้ามว่าง.',
                    counter: value => value.length <= 10 || 'เต็ม 10 ตัวอักษร',
              },
          }
        },
        watch:{
          ac_u_table(newValue){
            if(newValue=="pk_teacher"){this.position="ครู / บุคลากร"}else{this.position="นักเรียน / นักศึกษา"}
          }
        },
        methods:{
           async accessories_add(){
            if(this.ac_description!='' && this.ac_name!='' &&this.img_font!=''&&this.img_side!=''&&this.img_rear!=''){
              let res=await this.$http.post("accessories/accessories_add",{
                ac_description:this.ac_description,
                ac_u_id:sessionStorage.getItem("username"),
                ac_name:this.ac_name,
                ac_u_table:"pk_student",

                img_font:this.img_font,
                img_side:this.img_side,
                img_rear:this.img_rear,
                u_table:"pk_accessories",
                u_id:sessionStorage.getItem("username"),

              })
              if(res.data.ok==true){this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt,this.accessories()}
              else{this.danger=true,this.alt_txt=res.data.txt,this.type_api=res.data.alt}
            }else{this.danger=true,this.alt_txt="กรุณากรอกข้อมูลให้ครบ",this.type_api="error"}
          },
          accessories(){
            this.$router.push({name:"student-accessories"})
          },
          upload_img_font(e){
            const image = e.target.files[0];
            const reader = new FileReader();
            reader.readAsDataURL(image);
            reader.onload = e =>{              
              this.img_font=e.target.result;
              console.log(this.img_font);
            };
          },
          upload_img_side(e){
            const image = e.target.files[0];
            const reader = new FileReader();
            reader.readAsDataURL(image);
            reader.onload = e =>{              
              this.img_side=e.target.result;
              // console.log("this.img_side");
              console.log(this.img_side);
            };
          },
          upload_img_rear(e){
            const image = e.target.files[0];
            const reader = new FileReader();
            reader.readAsDataURL(image);
            reader.onload = e =>{              
              this.img_rear=e.target.result;
              console.log(this.img_rear);
            };
          },
        }
    }
</script>