unit UImovel_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, DBPanel, DBCtrls, StdCtrls, ActnList, ImgList, DB,
  Menus, ComCtrls, Mask, Buttons, ExtCtrls, ExtDlgs, JPEG, OraTeste,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFImovel_Cad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    ImgImovel1: TImage;
    ImgImovel2: TImage;
    ImgImovel3: TImage;
    ImgImovel4: TImage;
    ImgImovel5: TImage;
    ImgImovel6: TImage;
    ImgImovel7: TImage;
    ImgImovel8: TImage;
    ImgImovel9: TImage;
    ImgImovel10: TImage;
    Label233: TLabel;
    MECaminhoImagem: TMaskEdit;
    btnIncluirImagem: TBitBtn;
    btnProcurar: TBitBtn;
    OPDImagem: TOpenPictureDialog;
    dsImagemImovel_Cad: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    ChExcluir1: TCheckBox;
    ChExcluir2: TCheckBox;
    ChExcluir3: TCheckBox;
    ChExcluir4: TCheckBox;
    ChExcluir5: TCheckBox;
    ChExcluir6: TCheckBox;
    ChExcluir7: TCheckBox;
    ChExcluir8: TCheckBox;
    ChExcluir9: TCheckBox;
    ChExcluir10: TCheckBox;
    BtExcluir: TBitBtn;
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnIncluirImagemClick(Sender: TObject);
    procedure ImgImovel1Click(Sender: TObject);
    procedure dsImagemImovel_CadDataChange(Sender: TObject; Field: TField);
    procedure DBEdit2Change(Sender: TObject);
    procedure ImgImovel2Click(Sender: TObject);
    procedure ImgImovel3Click(Sender: TObject);
    procedure ImgImovel4Click(Sender: TObject);
    procedure ImgImovel5Click(Sender: TObject);
    procedure ImgImovel6Click(Sender: TObject);
    procedure ImgImovel7Click(Sender: TObject);
    procedure ImgImovel8Click(Sender: TObject);
    procedure ImgImovel9Click(Sender: TObject);
    procedure ImgImovel10Click(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
  private
    procedure incluiImagem(caminho: string);
    procedure AtualizarImagem;
    procedure MostraImgMax(Query: TOracleDataset1; FieldImg: TField);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImovel_Cad: TFImovel_Cad;

implementation

uses UImobiliaria_cl, UCondominio_Cons, UImovel_Cons, UCadastroCons,
  UCidadeCons, Math;

{$R *.dfm}

procedure TFImovel_Cad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCondominio_Cons;
  Classe := TFCondominio_Cons;

end;

procedure TFImovel_Cad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;

end;

procedure TFImovel_Cad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;

end;

procedure TFImovel_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMImobiliaria.QImovel_Cad.Open;
  DMImobiliaria.QImagem_Imovel_Cad.Open;
end;

procedure TFImovel_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMImobiliaria.QImovel_Cad.Close;
  DMImobiliaria.QImagem_Imovel_Cad.Close;
end;

procedure TFImovel_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;

  If FImovel_Cons = Nil then
    FImovel_Cons := TFImovel_Cons.Create(Application);
  If FImovel_Cons.ShowModal = mrOk then
  With DMImobiliaria do
  Begin
    QImovel_Cad.Close;
    QImovel_Cad.SetVariable('PK',QImovel_ConsCod_Imovel.Value);
    QImovel_Cad.Open;
  End;

end;

procedure TFImovel_Cad.btnProcurarClick(Sender: TObject);
begin
  inherited;
  if OPDImagem.Execute then
    MECaminhoImagem.Text := OPDImagem.FileName;

end;

procedure TFImovel_Cad.btnIncluirImagemClick(Sender: TObject);
begin
  inherited;
  if DMImobiliaria.QImovel_Cad.IsEmpty then
   Begin
     DMImobiliaria.QImagem_Imovel_Cad.Insert;
     DMImobiliaria.QImagem_Imovel_CadCod_Imovel.Value := DMImobiliaria.QImovel_CadCod_Imovel.Value;
   End
  else
     DMImobiliaria.QImagem_Imovel_Cad.Edit;
  IncluiImagem(MeCaminhoImagem.Text);
  DMImobiliaria.QImagem_Imovel_Cad.Post;
end;


procedure TFImovel_Cad.incluiImagem(caminho: string);
var
  MyJPEG: TJPEGImage;
  MyBMP: TBitmap;
  (*stream, *)outStream: TMemoryStream;
  ext: string;

  StretchBitmap: TBitmap;
  Ratio: double;
  ARect: TRect;

  Height, width: integer;
begin
  inherited;

  if not FileExists(caminho) then
    raise Exception.Create('Arquivo não encontrado');

  ext := ExtractFileExt(LowerCase(caminho));
  if (ext <> '.bmp') and (ext <> '.jpg') and (ext <> '.jpeg') then
    raise Exception.Create('Arquivo Inválido');

  OutStream := TMemoryStream.Create;
  MyJPEG := TJPEGImage.Create;
  MyBMP := TBitmap.Create;

  // Create bitmap
  StretchBitmap := TBitmap.Create;
  try
    //se a figura informada for um bitmap é feita a conversão para jpeg
    if ext = '.bmp' then
    begin
      MyBMP.LoadFromFile(caminho);
      MyJPEG.Assign(MyBMP);
      MyJPEG.Compress;
    end
    else //se for jpg/jpeg
      MyJPEG.LoadFromFile(caminho);

    //-------redimensiona a imagem para ficar com o tamanho apropriado-----------
    if (MessageDlg('Redimensionar imagem?'+#13+#10+'(Deixa ela em tamanho menor, ganhando espaço. Porém, ficará menos legível)', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      // Adjust parameters
      Ratio := 0;
      Height := 240;
      width := 200;

      if MyJPEG.Height > 0 then
        Ratio := MyJPEG.Width / MyJPEG.Height;

      if Ratio > 1 then
        Height := Round(width / Ratio)
      else
        Width := Round(Height * Ratio);

      // Set bitmap atributes
      StretchBitmap.Width := width;
      StretchBitmap.Height := Height;
      StretchBitmap.Canvas.Brush.Color := clWindow;
      StretchBitmap.Canvas.FillRect(Rect(0, 0, Width, Height));

      // StretchDraw original image
      ARect := Rect(0, 0, width, Height);
      StretchBitmap.Canvas.StretchDraw(ARect, MyJPEG);

      // Assign back to the Jpeg, and save to the output file
      MyJPEG.Assign(StretchBitmap);
    end;
    MyJPEG.SaveToStream(OutStream);
    //---------fim redimensiona a imagem------------

    //------------grava a imagem no banco de dados-----------------
    If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM01.IsNull then
       DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM01.LoadFromStream(outStream)
    Else
      If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM02.IsNull then
         DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM02.LoadFromStream(outStream)
      Else
        If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM03.IsNull then
           DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM03.LoadFromStream(outStream)
        Else
          If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM04.IsNull then
             DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM04.LoadFromStream(outStream)
          Else
            If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM05.IsNull then
               DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM05.LoadFromStream(outStream)
            Else
              If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM06.IsNull then
                 DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM06.LoadFromStream(outStream)
              Else
                If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM07.IsNull then
                   DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM07.LoadFromStream(outStream)
                Else
                  If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM08.IsNull then
                     DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM08.LoadFromStream(outStream)
                  Else
                    If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM09.IsNull then
                       DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM09.LoadFromStream(outStream)
                    Else
                      If DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM10.IsNull then
                         DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM10.LoadFromStream(outStream);

    //----------fim grava imagem no banco de dados------------

    AtualizarImagem;
  finally
    MyJPEG.Free;
    MyBMP.Free;
    StretchBitmap.Free;
  end;
end;

procedure TFImovel_Cad.AtualizarImagem;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  // transferindo a fotografia para o objeto TStream
  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM01, bmRead);

  // se o registro não possui fotografia então apagaremos a imagem
  // atual dentro do TImage, senão vai parecer que a fotografia seguinte
  // será igual a anterior
  if b.Size > 0 then
  begin
    // aqui ta o problema, como recuperar o jpeg do banco
    // perceba que a variavel 'Jpg' é do tipo TJpegImage que por sua vez é uma classe TGraphic
    // e que portanto poderá ser assinalada a propriedade Image1.Picure[.Graphic]
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel1.Picture.Assign(Jpg);
      ImgImovel1.visible := true;
      ChExcluir1.visible := true;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    ImgImovel1.Picture.Assign(nil);
    ImgImovel1.Visible := false;
    ChExcluir1.visible := false;
  end;

  // a partir deste ponto repete a rotina anterior para as outras 9 figuras

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM02, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel2.Picture.Assign(Jpg);
      ImgImovel2.visible := true;
      ChExcluir2.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel2.Picture.Assign(nil);
    ImgImovel2.Visible := false;
    ChExcluir2.visible := false;
  end;

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM03, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel3.Picture.Assign(Jpg);
      ImgImovel3.visible := true;
      ChExcluir3.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel3.Picture.Assign(nil);
    ImgImovel3.Visible := false;
    ChExcluir3.visible := false;
  end;

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM04, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel4.Picture.Assign(Jpg);
      ImgImovel4.visible := true;
      ChExcluir4.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel4.Picture.Assign(nil);
    ImgImovel4.Visible := false;
    ChExcluir4.visible := false;
  end;

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM05, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel5.Picture.Assign(Jpg);
      ImgImovel5.visible := true;
      ChExcluir5.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel5.Picture.Assign(nil);
    ImgImovel5.Visible := false;
    ChExcluir5.visible := false;
  end;

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM06, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel6.Picture.Assign(Jpg);
      ImgImovel6.visible := true;
      ChExcluir6.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel6.Picture.Assign(nil);
    ImgImovel6.Visible := false;
    ChExcluir6.visible := false;
  end;

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM07, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel7.Picture.Assign(Jpg);
      ImgImovel7.visible := true;
      ChExcluir7.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel7.Picture.Assign(nil);
    ImgImovel7.Visible := false;
    ChExcluir7.visible := false;
  end;

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM08, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel8.Picture.Assign(Jpg);
      ImgImovel8.visible := true;
      ChExcluir8.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel8.Picture.Assign(nil);
    ImgImovel8.Visible := false;
    ChExcluir8.visible := false;
  end;

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM09, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel9.Picture.Assign(Jpg);
      ImgImovel9.visible := true;
      ChExcluir9.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel9.Picture.Assign(nil);
    ImgImovel9.Visible := false;
    ChExcluir9.visible := false;
  end;

  b := DMImobiliaria.QImagem_Imovel_Cad.CreateBlobStream(DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM10, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      ImgImovel10.Picture.Assign(Jpg);
      ImgImovel10.visible := true;
      ChExcluir10.visible := true;
    except
    end;
  end
  else
  begin
    ImgImovel10.Picture.Assign(nil);
    ImgImovel10.Visible := false;
    ChExcluir10.visible := false;
  end;

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;


procedure TFImovel_Cad.ImgImovel1Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM01);

end;

procedure TFImovel_Cad.MostraImgMax(Query: TOracleDataset1; FieldImg: TField);
var
  Stream: TStream;
  FormImg: TForm;
  Pic: TImage;
  Jpg: TJPEGImage;
begin
  //Mostrar imagem aumentada
  if not FieldImg.IsNull then
  begin
    Stream := Query.CreateBlobStream(FieldImg, bmRead);
    Jpg := TJPEGImage.Create;
    Jpg.LoadFromStream(Stream);

    FormImg := TForm.Create(Application);
    Pic := TImage.Create(FormImg);
    Pic.Parent := FormImg;
    Pic.Align := alClient;
    FormImg.BorderStyle := bsDialog;
    FormImg.Position := poScreenCenter;
    FormImg.ClientHeight := IfThen(Jpg.Height > 0, Jpg.Height, 100);
    FormImg.ClientWidth := IfThen(Jpg.Width > 0, Jpg.Width, 100);
    FormImg.Caption := 'Imagem no tamanho normal';
    Pic.Picture.Assign(Jpg);
    FormImg.ShowModal;
    FormImg.Free;
  end;
End;

procedure TFImovel_Cad.dsImagemImovel_CadDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
{  if (DMImobiliaria.QImagem_Imovel_Cad.RecordCount <= 0) Or
     (DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM01.IsNull) then
   begin
     btnIncluirImagem.Enabled := true;
     btnProcurar.Enabled := true;
     btnExcluirImagem.Enabled := false;
     MECaminhoImagem.Text := 'C:\';
     MECaminhoImagem.ReadOnly := true;
     MECaminhoImagem.Color := clWindow;
     MECaminhoImagem.TabStop := true;
   end
  else
   begin
     btnIncluirImagem.Enabled := false;
     btnProcurar.Enabled := false;
     btnExcluirImagem.Enabled := true;
     MECaminhoImagem.Text := '[Imagem já incluída]';
     MECaminhoImagem.ReadOnly := false;
     MECaminhoImagem.Color := clBtnFace;
     MECaminhoImagem.TabStop := false;
   end;
}
end;

procedure TFImovel_Cad.DBEdit2Change(Sender: TObject);
begin
  inherited;
  AtualizarImagem;
end;

procedure TFImovel_Cad.ImgImovel2Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM02);

end;

procedure TFImovel_Cad.ImgImovel3Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM03);

end;

procedure TFImovel_Cad.ImgImovel4Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM04);

end;

procedure TFImovel_Cad.ImgImovel5Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM05);

end;

procedure TFImovel_Cad.ImgImovel6Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM06);

end;

procedure TFImovel_Cad.ImgImovel7Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM07);

end;

procedure TFImovel_Cad.ImgImovel8Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM08);

end;

procedure TFImovel_Cad.ImgImovel9Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM09);

end;

procedure TFImovel_Cad.ImgImovel10Click(Sender: TObject);
begin
  inherited;
  with DMImobiliaria do
    MostraImgMax(QImagem_Imovel_Cad, QImagem_Imovel_CadIMG_IMAGEM10);

end;

procedure TFImovel_Cad.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if (DMImobiliaria.QImagem_Imovel_Cad.RecordCount > 0) Then
   Begin
     DMImobiliaria.QImagem_Imovel_Cad.Edit;
     If ChExcluir1.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM01.Clear;
     If ChExcluir2.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM02.Clear;
     If ChExcluir3.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM03.Clear;
     If ChExcluir4.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM04.Clear;
     If ChExcluir5.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM05.Clear;
     If ChExcluir6.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM06.Clear;
     If ChExcluir7.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM07.Clear;
     If ChExcluir8.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM08.Clear;
     If ChExcluir9.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM09.Clear;
     If ChExcluir10.Checked then
        DMImobiliaria.QImagem_Imovel_CadIMG_IMAGEM10.Clear;
     DMImobiliaria.QImagem_Imovel_Cad.Post;
     ChExcluir1.Checked := False;
     ChExcluir2.Checked := False;
     ChExcluir3.Checked := False;
     ChExcluir4.Checked := False;
     ChExcluir5.Checked := False;
     ChExcluir6.Checked := False;
     ChExcluir7.Checked := False;
     ChExcluir8.Checked := False;
     ChExcluir9.Checked := False;
     ChExcluir10.Checked := False;
   End;
   AtualizarImagem;
end;

end.
