unit UPrecoCidadeClasseCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFPrecoCidadeClasseCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SbCidadeCons: TSpeedButton;
    DBDirceu1: TDBDirceu;
    SbClasseCons: TSpeedButton;
    DBDirceu2: TDBDirceu;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    PreoPCidade1: TMenuItem;
    procedure SbCidadeConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SbClasseConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure PreoPCidade1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoCidadeClasseCad: TFPrecoCidadeClasseCad;

implementation

uses UPrecoCidadeClasse_cl, UCidadeCons, UCidade_cl, UClasseCons,
  UClasse_cl, UPrecoCidadeClasseCons, UPrecoCidadeClasseParam,
  URPrecoCidadeClasse;

{$R *.dfm}

procedure TFPrecoCidadeClasseCad.SbCidadeConsClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.ShowModal = MrOk then
    DMPrecoCidadeClasse.QPrecoCidadeClasseCOD_CIDADE.Value := DMCidade.QCidadeConsCOD_CIDADE.Value;
end;

procedure TFPrecoCidadeClasseCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Close;
  DSPrimario.DataSet.Open;
end;

procedure TFPrecoCidadeClasseCad.SbClasseConsClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil Then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
    DMPrecoCidadeClasse.QPrecoCidadeClasseCOD_CLASSE.Value := DMClasse.QClasseConsCOD_CLASSE.Value;
end;

procedure TFPrecoCidadeClasseCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPrecoCidadeClasseCons = Nil then
    FPrecoCidadeClasseCons := TFPrecoCidadeClasseCons.Create(Application);
  if FPrecoCidadeClasseCons.ShowModal = MrOk then
    with DMPrecoCidadeClasse do
    begin
      QPrecoCidadeClasse.Close;
      QPrecoCidadeClasse.SetVariable('PK', QPrecoCidadeClasseConsCOD_PRECO_CIDADE_CLASSE.Value);
      QPrecoCidadeClasse.Open;
    end;
end;

procedure TFPrecoCidadeClasseCad.PreoPCidade1Click(Sender: TObject);
begin
  inherited;

  if FPrecoCidadeClasseParam = Nil then
    FPrecoCidadeClasseParam := TFPrecoCidadeClasseParam.Create(Application);
  FPrecoCidadeClasseParam.PGRelatorio.Pages[0].TabVisible := True;
  if FPrecoCidadeClasseParam.ShowModal = MrOk then
  begin
    with DMPrecoCidadeClasse do
    begin

      QRPrecoCidadeClasse.Close;

      //Frames----------------------------
      if Trim(FPrecoCidadeClasseParam.FmCidade1.MeCidade.Text) <> '' then
        QRPrecoCidadeClasse.SetVariable('COD_CIDADE', StrToInt(Trim(FPrecoCidadeClasseParam.FmCidade1.MeCidade.Text)))
      else
        QRPrecoCidadeClasse.SetVariable('COD_CIDADE', Null);

      if Trim(FPrecoCidadeClasseParam.FmClasse1.MeClasse.Text) <> '' then
        QRPrecoCidadeClasse.SetVariable('COD_CLASSE', StrToInt(Trim(FPrecoCidadeClasseParam.FmClasse1.MeClasse.Text)))
      else
        QRPrecoCidadeClasse.SetVariable('COD_CLASSE', Null);

      if Trim(FPrecoCidadeClasseParam.Me1DtInicial.Text) <> '' then
        QRPrecoCidadeClasse.SetVariable('DATA_I', StrToDate(Trim(FPrecoCidadeClasseParam.Me1DtInicial.Text)))
      else
        Raise Exception.Create('É necessário informar a Data Referência Inicial');

      if Trim(FPrecoCidadeClasseParam.Me1DtFinal.Text) <> '' then
        QRPrecoCidadeClasse.SetVariable('DATA_F', StrToDate(Trim(FPrecoCidadeClasseParam.Me1DtFinal.Text)))
      else
      begin
        FPrecoCidadeClasseParam.Me1DtFinal.Text := DateToStr(date);
        QRPrecoCidadeClasse.SetVariable('DATA_F', Date);
      end;
      //----------------------------------

      QRPrecoCidadeClasse.Open;

      if FRPrecoCidadeClasse = Nil then
        FRPrecoCidadeClasse := TFRPrecoCidadeClasse.Create(Application);

      //Cabeçalho Relatorio
      //-----------------------------------
      FRPrecoCidadeClasse.QRLTitulo.Caption  := 'Relatório de Preço P/ Cidade';
      FRPrecoCidadeClasse.QRLPeriodo.Caption := 'De: '   + Trim(FPrecoCidadeClasseParam.Me1DtInicial.Text) +
                                                ' Até: ' + Trim(FPrecoCidadeClasseParam.Me1DtFinal.Text);
      //-----------------------------------
      
      if FPrecoCidadeClasseParam.RGPreview.ItemIndex = 0 then
        FRPrecoCidadeClasse.QrPrimario.Preview
      else
        FRPrecoCidadeClasse.QrPrimario.Print;

      QRPrecoCidadeClasse.Close;
    end;
  end;
end;

end.
