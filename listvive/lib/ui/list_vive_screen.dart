import 'package:flutter/material.dart';
import 'package:listvive/ui/widgets/item.dart';

class ListViveScreen extends StatelessWidget {
  const ListViveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items =[
      Item(
                  image: Image.network(
                    'https://imgs.search.brave.com/_zWcb9FCMJ7uW3r2hdSTgpQMmIrORRH_pDLANyZ-Rfk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3N5c3RlbS9y/ZXNvdXJjZXMvdGh1/bWJuYWlscy8wNzEv/Mzc4LzUyOC9zbWFs/bC9zY2VuaWMtbW91/bnRhaW4tcmFuZ2Ut/dmlldy1hdC1zdW5z/ZXQtd2l0aC1zbm93/LWNhcHBlZC1wZWFr/cy1waG90by5qcGc',
                    fit: BoxFit.cover
                    ),
                  title: 'Mountain View #1',
                  subtitle: 'Mountain View #1 Tandzever'
                ),
                Item(
                  image: Image.network(
                    'https://imgs.search.brave.com/ZMZITsWt-yG6WZPrGy0m79bYsrVId5HhQ11RUmq7RNM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3LnJlZGQuaXQv/d2hhdC1kb2VzLXRo/ZS12aWxsYWdlLWxp/ZmUtbG9vay1saWtl/LWluLXlvdXItY3Vs/dHVyZS12MC10YmNu/YXU0OG12c2YxLmpw/ZWc_d2lkdGg9NzQw/JmZvcm1hdD1wanBn/JmF1dG89d2VicCZz/PWQ3YjIyNjFlMGIy/NTU3NmIxNmU0MTMw/ODlkYmU5NzFkNjcy/ZWEzMDE',
                    fit: BoxFit.cover
                    ),
                  title: 'Villige Life #2',
                  subtitle: 'Villige Life #2 Tandzever'
                ),
                Item(
                  image: Image.network(
                    'https://imgs.search.brave.com/1Z7xhN1-SoSFSIxTRNEmIFvrqsDJzazhKFx1WZ0XIU0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTM5/MjkwNjgwMi9waG90/by92aWV3LW9mLW1v/dW50YWluLXJhbmdl/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz14Sl9yb3Q3U1dK/eEYwR3dLanV0TUNa/d2hDWVYwOTdxdWRo/RUQ3YzBENEVNPQ',
                    fit: BoxFit.cover
                    ),
                  title: 'Villige Life #3',
                  subtitle: 'Mountain View #3 Tandzever'
                ),
                Item(
                  image: Image.network(
                    'https://imgs.search.brave.com/CgV_PO6NIc_om1CY7BqLf2L6thhuqX9BxQybngMUvZc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3N5c3RlbS9y/ZXNvdXJjZXMvdGh1/bWJuYWlscy8wMDUv/NDU5LzU2Ni9zbWFs/bC9jb2xvcmZ1bC1s/YW5kc2NhcGUtdmll/dy1vZi1saXR0bGUt/dmlsbGFnZS1rYXBw/ZWxyb2RlY2stcGhv/dG8uanBn',
                    fit: BoxFit.cover
                    ),
                  title: 'Villige View #4',
                  subtitle: 'Mountain View #4'
                ),
    ];
    return Scaffold(
      backgroundColor: const Color(0xff272b49),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: AppBar(
                      toolbarHeight: 70,
                      backgroundColor: const Color(0xff373760),
                      title: const Text('Flutter Learning UI',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://imgs.search.brave.com/pGNnFmlffZmkdkEpjS2Ukpc_FpjKX_vRfLghQLDGwYg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/bWFnbmlmaWMuY29t/L2ZyZWUtcGhvdG8v/b2xkLXJlc2lkZW50/aWFsLWJ1aWxkaW5n/cy12aWxsYWdlLW11/c2V1bS1idWNoYXJl/c3Qtcm9tYW5pYV8x/MjY4LTIxNjUwLmpw/Zz9nYT1HQTEuMS4y/MDg5NzE2MjQ3LjE3/ODI0MDM2MTMmc2Vt/dD1haXNfaHlicmlk/Jnc9NzQwJnE9ODA',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text('Gallery View', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff5e606b),
                      ),
                      height: 60,
                      width: 190
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xff373760),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.qr_code,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                  child: Text(
                    'Item List',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index];
                  },
                )
                              ],
            ),
          ],
        ),
      ),
    );
  }
}