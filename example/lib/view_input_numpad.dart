part of 'showcase_page.dart';

class ViewInputNumpadPage extends StatefulWidget {
  const ViewInputNumpadPage({super.key});

  @override
  State<ViewInputNumpadPage> createState() => _ViewInputNumpadPageState();
}

class _ViewInputNumpadPageState extends State<ViewInputNumpadPage> {
  TextEditingController amountDisplayController = TextEditingController(
    text: '0',
  );

  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    amountController.addListener(
      () => amountDisplayController.text =
          NumberFormat.currency(
            locale: 'id_ID',
            symbol: '',
            decimalDigits: 0,
          ).format(
            double.tryParse(
                  amountController.text.replaceAll(RegExp(r'\.0$'), ''),
                ) ??
                0,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Input Transfer Amount',
              style: TextStyle(fontSize: 18),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Destination:', style: TextStyle(fontSize: 14)),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'National Bank - John Smith',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 30),
                InputTextWidget(
                  enabled: false,
                  controller: amountDisplayController,
                  labelText: 'Amount',
                  prefixText: 'Rp ',
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '*minimum transfer amount is Rp 10.000',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 60),
                InputNumpadWidget(controller: amountController, maxLength: 13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
