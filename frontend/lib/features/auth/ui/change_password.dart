import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _isOldPasswordVisible = false; // สำหรับจัดการการแสดงรหัสผ่านเดิม
  bool _isNewPasswordVisible = false; // สำหรับจัดการการแสดงรหัสผ่านใหม่
  FocusNode _oldPasswordFocusNode = FocusNode(); // สำหรับการจัดการ focus
  FocusNode _newPasswordFocusNode = FocusNode(); // สำหรับการจัดการ focus

  @override
  void dispose() {
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'เปลี่ยนรหัสผ่าน',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ใส่รหัสผ่าน',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A5A5A)),
            ),
            const SizedBox(height: 20),
            // รหัสผ่านเดิม
            TextFormField(
              obscureText: !_isOldPasswordVisible, // ซ่อนรหัสผ่าน
              focusNode: _oldPasswordFocusNode,
              decoration: InputDecoration(
                labelText: 'รหัสผ่านเดิม',
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Color(0xFFD0D0D0),
                ),
                suffixIcon: _oldPasswordFocusNode
                        .hasFocus // ตรวจสอบว่ามีโฟกัสอยู่หรือไม่
                    ? IconButton(
                        icon: Icon(
                          _isOldPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _isOldPasswordVisible
                              ? const Color(0xFF41486D) // สีเมื่อแสดงรหัสผ่าน
                              : const Color(0xFFD0D0D0), // สีเมื่อซ่อนรหัสผ่าน
                        ),
                        onPressed: () {
                          setState(() {
                            _isOldPasswordVisible =
                                !_isOldPasswordVisible; // สลับสถานะ
                          });
                        },
                      )
                    : null, // ไม่แสดงไอคอนหากไม่มีโฟกัส
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFD0D0D0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF41486D),
                    width: 2.0,
                  ),
                ),
              ),
              onTap: () {
                setState(() {}); // รีเฟรชหน้าเมื่อผู้ใช้กดที่ TextField
              },
            ),
            const SizedBox(height: 12),
            // รหัสผ่านใหม่
            TextFormField(
              obscureText: !_isNewPasswordVisible, // ซ่อนรหัสผ่าน
              focusNode: _newPasswordFocusNode,
              decoration: InputDecoration(
                labelText: 'รหัสผ่านใหม่',
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Color(0xFFD0D0D0),
                ),
                suffixIcon: _newPasswordFocusNode
                        .hasFocus // ตรวจสอบว่ามีโฟกัสอยู่หรือไม่
                    ? IconButton(
                        icon: Icon(
                          _isNewPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _isNewPasswordVisible
                              ? const Color(0xFF41486D) // สีเมื่อแสดงรหัสผ่าน
                              : const Color(0xFFD0D0D0), // สีเมื่อซ่อนรหัสผ่าน
                        ),
                        onPressed: () {
                          setState(() {
                            _isNewPasswordVisible =
                                !_isNewPasswordVisible; // สลับสถานะ
                          });
                        },
                      )
                    : null, // ไม่แสดงไอคอนหากไม่มีโฟกัส
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFD0D0D0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF41486D),
                    width: 2.0,
                  ),
                ),
              ),
              onTap: () {
                setState(() {}); // รีเฟรชหน้าเมื่อผู้ใช้กดที่ TextField
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: const Color(0xFF41486D), // ปุ่มสีน้ำเงินเข้ม
                ),
                child: const Text(
                  'ยืนยัน',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
