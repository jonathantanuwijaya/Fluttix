part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 136,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 16),
                child: Text(
                  'New Experience',
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
              ),
              Text(
                'Watch a new movie much \neasier than any before',
                textAlign: TextAlign.center,
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Container(
                width: 250,
                height: 46,
                margin: EdgeInsets.only(top: 70, bottom: 19),
                child: RaisedButton(
                  color: mainColor,
                  onPressed: () {
                    context.read<PageBloc>().add(GoToRegistrationPage(RegistrationData()));
                  },
                  child: Text(
                    'Get Started',
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?',
                    style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: (){
                      context.read<PageBloc>().add(GoToLoginPage());
                    },
                    child: Text(
                      'Sign In',
                      style: purpleTextFont,
                    ),
                  )
                ],
              )
            ],
          )),
        ));
  }
}
