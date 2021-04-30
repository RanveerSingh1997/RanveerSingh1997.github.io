
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furnizor/Provider/DataProvider.dart';
import 'package:furnizor/Utils/utils.dart';
import 'package:furnizor/Widgets/widgets.dart';
import 'package:provider/provider.dart';

class FurnizorFormPage extends StatefulWidget {
  @override
  _FurnizorFormPageState createState() => _FurnizorFormPageState();
}

class _FurnizorFormPageState extends State<FurnizorFormPage> {
  var benefitsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    var benefits = provider.benefits;
    var spaceType = provider.spaceTypeList;
    var form = provider.formModel;
    return Material(
      child: SingleChildScrollView(
        child: Form(
          child: SafeArea(
            top: true,
            left: true,
            right: true,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin:EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height * .4,
                            color:Colors.grey.shade200,
                            child: form.images != null
                                ? Expanded(
                                  child: PageView.builder(
                                      controller: PageController(
                                          initialPage:
                                              provider.currentIndex),
                                      onPageChanged: (int) {
                                        provider.currentIndex = int;
                                      },
                                      itemCount: form.images.length,
                                      itemBuilder: (context, index) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.memory(
                                            form.images[index],
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }),
                                )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Choose Best From Gallery",
                                          textAlign: TextAlign.center,
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.add_circle_rounded,
                                              size: 48,
                                            ),
                                            onPressed: () async {
                                              form.images =
                                                  await chooseFileUsingFilePicker();
                                               setState(() {

                                               });
                                            }),
                                      ],
                                    ),
                                  ),
                          ),
                          form.images!=null?Container(
                            height: 60,
                            child: Center(
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    form.images.length,
                                        (index) => Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color:
                                        provider.currentIndex ==
                                            index
                                            ? Colors.orange
                                            : Colors.grey,
                                        shape: BoxShape.circle,
                                      ),
                                    )),
                              ),
                            ),
                          ):SizedBox(),
                          Row(
                            children: [
                              Expanded(
                                child: buildFormTextField(
                                  hintText: "Address",
                                  onChanged: (value) {},
                                ),
                              ),
                              Expanded(
                                child: buildFormTextField(
                                  hintText: "Country",
                                  onChanged: (value) {
                                    form.country = value.toString().trim();
                                  },
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: buildFormTextField(
                                  hintText: "State",
                                  onChanged: (value) {
                                    form.state = value.toString().trim();
                                  },
                                ),
                              ),
                              Expanded(
                                child: buildFormTextField(
                                  hintText: "City",
                                  onChanged: (value) {
                                    form.city = value.toString().trim();
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: List.generate(
                              spaceType.length,
                              (index) => Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    spaceType[index].isSelected =!spaceType[index].isSelected;
                                     setState(() {
                                     });
                                    },
                                  child: Container(
                                    height: 150,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: spaceType[index].isSelected
                                              ? Colors.orange
                                              : Colors.indigo,
                                          width:
                                              spaceType[index].isSelected ? 3 : 0),
                                      image: DecorationImage(
                                        image: AssetImage(spaceType[index].image),
                                        fit: BoxFit.cover,
                                        colorFilter:ColorFilter.mode(
                                            Colors.black.withOpacity(0.2),
                                            BlendMode.dstATop),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(
                                            spaceType[index].isSelected
                                                ? Icons.check_circle_rounded
                                                : Icons.add_circle_rounded,
                                            color: spaceType[index].isSelected
                                                ? Colors.orange
                                                : Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          spaceType[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          spaceType[index].subtitle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: buildFormTextField(
                                    hintText: "Mobile Number",
                                    maxLength: 10,
                                    inputFormater: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyBoardType: TextInputType.numberWithOptions(
                                        decimal: true),
                                    onChanged: (value) {
                                      form.phoneNumber = value.toString().trim();
                                    }),
                              ),
                              Expanded(
                                child: buildFormTextField(
                                    hintText: "Space Name",
                                    keyBoardType: TextInputType.text,
                                    onChanged: (value) {
                                      form.spaceName = value.toString().trim();
                                    }),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: buildFormTextField(
                                    hintText: "Email",
                                    keyBoardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      form.price = value.toString().trim();
                                    }),
                              )
                            ],
                          ),
                          buildFormTextField(
                              hintText: "Description",
                              maxLines: 6,
                              keyBoardType: TextInputType.text,
                              onChanged: (value) {
                                form.price = value.toString().trim();
                              }),
                        ],
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  child: Card(
                      child: ListTile(
                        title: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Select Your Benefits"),
                              Wrap(
                                clipBehavior: Clip.hardEdge,
                                children: List.generate(
                                    benefits.length,
                                        (index) => Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: benefits[index]
                                              .isSelected
                                              ? Colors.indigo.shade200
                                              : Colors.grey.shade200,
                                          borderRadius:
                                          BorderRadius.circular(
                                              10)),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: [
                                            Text(benefits[index]
                                                .title),
                                            IconButton(
                                              onPressed: () {
                                                benefits[index].isSelected =!benefits[index].isSelected;
                                                setState(() {});
                                              },
                                              icon: benefits[index]
                                                  .isSelected
                                                  ? Icon(Icons
                                                  .check_circle)
                                                  : Icon(Icons
                                                  .check_circle_outline_sharp),
                                              color: benefits[index]
                                                  .isSelected
                                                  ? Colors.indigo
                                                  : Colors.grey,
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: buildFormTextField(
                                controller: benefitsController,
                                hintText:"Write your benefits you want to add",
                                onChanged:(value){

                                },
                              ),
                            ),
                            OutlinedButton(
                                child: Text("Add"),
                                onPressed: () {
                                  setState(() {
                                    benefits.add(Benefits(title: benefitsController.text.trim(), isSelected: true),);
                                    benefitsController.clear();
                                  });
                                })
                          ],
                        ),
                      )),
                ),
                SizedBox(height:30,),
                CupertinoButton.filled(
                  onPressed: () {
                    form.benefits=[];
                    benefits.forEach((element) {
                      if (element.isSelected) {
                        form.benefits.add(element.title);
                      } else {}
                    });
                    setState(() {
                    });
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
