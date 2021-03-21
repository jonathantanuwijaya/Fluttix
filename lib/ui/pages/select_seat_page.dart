part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;

  SelectSeatPage(this.ticket);

  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .read<PageBloc>()
              .add(GoToSelectSchedulePage(widget.ticket.movieDetail));
          return;
        },
        child: Scaffold(
            body: Stack(
              children: [
                Container(
                  color: accentColor1,
                ),
                SafeArea(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                ListView(
                  children: [
                    Column(
                      children: [

                        /// Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20, left: defaultMargin),
                              padding: EdgeInsets.all(1),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<PageBloc>().add(
                                      GoToSelectSchedulePage(
                                          widget.ticket.movieDetail));
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.only(top: 20, right: defaultMargin),
                              child: Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(1),
                                      margin: EdgeInsets.only(right: 16),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width / 2,
                                      child: Text(
                                        widget.ticket.movieDetail.title,
                                        maxLines: 2,
                                        style: blackTextFont.copyWith(
                                            fontSize: 20),
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.end,
                                      )),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              imageBaseURL +
                                                  'w154' +
                                                  widget.ticket.movieDetail
                                                      .posterPath,
                                            ),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                        /// Cinema Screen
                        Container(
                          width: 277,
                          height: 84,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/screen.png"))),
                        ),

                        /// Seats
                        generateSeats(),

                        /// Next Button
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: FloatingActionButton(
                            onPressed: selectedSeats.length > 0 ? () {
                              context.read<PageBloc>().add(GoToCheckoutPage(
                                  widget.ticket.copyWith(seats: selectedSeats)));
                            } : null,
                            elevation: 0,
                            backgroundColor: selectedSeats.length > 0
                                ? mainColor
                                : Colors.grey[300],
                            child: Icon(
                              Icons.arrow_forward,
                              color: selectedSeats.length > 0
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    )
                  ],
                )
              ],
            )));
  }

  Column generateSeats() {
    List<int> numberofSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];
    for (int i = 0; i < numberofSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            numberofSeats[i],
                (index) =>
                Padding(
                  padding: EdgeInsets.only(
                      right: (index < numberofSeats[i] - 1) ? 16 : 0,
                      bottom: 16),
                  child: SelectableBox(
                    "${String.fromCharCode(i + 65)}${index + 1}",
                    width: 40,
                    height: 40,
                    textStyle: whiteNumberFont.copyWith(color: Colors.black),
                    isSelected: selectedSeats
                        .contains("${String.fromCharCode(i + 65)}${index + 1}"),
                    onTap: () {
                      String seatNumber =
                          "${String.fromCharCode(i + 65)}${index + 1}";
                      setState(() {
                        if (selectedSeats.contains(seatNumber)) {
                          selectedSeats.remove(seatNumber);
                        } else {
                          selectedSeats.add(seatNumber);
                        }
                      });
                    },
                    isEnabled: index != 0,
                  ),
                )),
      ));
    }
    return Column(
      children: widgets,
    );
  }
}