/* https://ejmastnak.com/tutorials/arch/backlight/
	==intel_backlight==
	# This code would go inside `/etc/udev/rules.d/backlight.rules` you have to create it
	# Set `video` as the owning group for the `/sys/class/backlight/intel_backlight/brightness` file
	RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
	# Give write permisssions to the owning group of the `brightness` file
	RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
	
	==acpi_video0==
	# This code would go inside `/etc/udev/rules.d/backlight.rules`
	# Set `video` as the owning group for the device with kernel name
	# `acpi_video0` and subsystem `backlight` (i.e. your backlight);
	# give the device's owning user and group read and write permissions
	# and give only read permissions to other users (i.e. 0664).
	ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", GROUP="video", MODE="0664"
*/

#include <cstdlib>
#include <iostream>
#include <string>
//#include
using namespace std;
string root = "sudo";
int brt_inc = 500;
string cc1 = "brt_up";
string cc2 = "brt_down";
string cc3 = "wrl_chg";
string cc3_v1 = "started";
string cc3_v2 = "stopped";

string get_sys_V(string command){
	const char * cc = command.c_str();
	FILE *sys_V = popen(cc, "r");
	char buf[256];
	while (fgets(buf, sizeof(buf), sys_V) != 0) {
	}
	//cout << command << buf  << endl;
	return(buf);
	pclose(sys_V);
}
	//y = system("echo 1");

int str_int(string str){
	return(stoi(str));
}
//==brightness==
int brt(){return(str_int(get_sys_V("cat /sys/class/backlight/intel_backlight/brightness")));}
int brt_max(){return(str_int(get_sys_V("cat /sys/class/backlight/intel_backlight/max_brightness")));}
//void brt_chg(int new_brt){system("echo " new_brt " | sudo tee /sys/class/backlight/intel_backlight/brightness";}
void brt_chg(int val){
	string set_brt = "echo ";
	set_brt += to_string(val);
	set_brt += " > /sys/class/backlight/intel_backlight/brightness";
	const char* mlm = set_brt.c_str();
	cout << mlm << endl;
	system(mlm);
	int test = system(mlm);
	if (test == 0) {cout << "faild to do s" << endl;}
}
//==networking==
bool net_stat(){
	bool rrep;
	string rep;
	rep = get_sys_V("service networking status");
	rep = rep.substr(11, rep.length());
	if (rep == "stopped"){rrep = false;}
	if (rep == "started"){rrep = true;}

	cout << rep << endl;
	return(rrep);
}



const string yy = "yLL";

int main(int argc, char* argv[]){

	cout << "test" << endl;
	string y;
	//cin >> y;
	//y = string(argv[1]);
	int instrep;

	if (string(argv[1]) == cc1){ //==sreen brt UP==
		if (brt_max() -brt_inc  >= brt()) {instrep = brt(); instrep += brt_inc;}
		else{instrep = brt_max();}
		brt_chg(instrep);
	}
	if (string(argv[1]) == cc2){ //==screen brt DOWN==
		if (brt()-brt_inc > 0) {instrep = brt(); instrep += -brt_inc;}
		else{instrep = 0;}
		brt_chg(instrep);
	}
	
	//cout << get_sys_V("service networking status") << endl;
	//net_stat();
	
	if (string(argv[1]) == cc3){
		setuid("lhl")
		if (net_stat()){
			instrep = system("whoami");
			if (instrep != 0){cout << "could not stop network" << endl;}
			cout << "i tried to stop" << endl;
		}else{
			instrep = system("doas user service networking start");
			if (instrep != 0){cout << "cluld not start network" << endl;}
			cout << "i tried to start" << endl;
		}
	}
}
