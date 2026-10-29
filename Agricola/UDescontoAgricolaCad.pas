unit UDescontoAgricolaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBDirceu, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFDescontoAgricolaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BTConsProduto: TBitBtn;
    Desconto1: TMenuItem;
    Label2: TLabel;
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    Opo1: TMenuItem;
    DuplicaTabelaDesconto1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BTConsProdutoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Desconto1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DuplicaTabelaDesconto1Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDescontoAgricolaCad: TFDescontoAgricolaCad;

implementation

uses UDescontoAgricola_cl, UProdutoCons, UProduto_cl, UDescontoAgricolaCons,
  URDescontoAgricola_Desconto, UDescontoAgricolaParam, UFilialCons, UOracle_cl,
  UFilial_cl, UUsuario_cl, UDescontoAgricolaDuplica;

{$R *.DFM}

procedure TFDescontoAgricolaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMDescontoAgricola.QDescAgr.Open;
end;

procedure TFDescontoAgricolaCad.BTConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     DMDescontoAgricola.QDescAgrCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;

end;

procedure TFDescontoAgricolaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FDescontoAgricolaCons = nil then
     FDescontoAgricolaCons := TFDescontoAgricolaCons.Create(Application);
  If FDescontoAgricolaCons.ShowModal = mrOK then
     with DMDescontoAgricola do
     begin
        QDescAgr.Close;
        QDescAgr.SetVariable('PK',QDescAgrConsCod_Produto.Value);
        QDescAgr.SetVariable('UMIDADE',QDescAgrConsPerc_Umidade.Value);
        QDescAgr.SetVariable('FILIAL',QDescAgrConsCod_Filial.Value);
        QDescAgr.Open;
     end;
end;


procedure TFDescontoAgricolaCad.Desconto1Click(Sender: TObject);
begin
  inherited;
  if FDescontoAgricolaParam = Nil then
    FDescontoAgricolaParam:= TFDescontoAgricolaParam.Create(Application);
  FDescontoAgricolaParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FDescontoAgricolaParam.ShowModal =  mrOk then
   Begin
     DmUsuario.Checar_Filial_Usuario( Trim(FDescontoAgricolaParam.MEFilial.Text),'AGRICOLA');
     With DMDescontoAgricola do
     Begin
       QRDescAgr.Close;
       if Trim(FDescontoAgricolaParam.MECodProduto.text) <>'' then
         QRDescAgr.SetVariable('PRODUTO',FDescontoAgricolaParam.MECodProduto.text)
       else
         QRDescAgr.SetVariable('PRODUTO',Null);
       if Trim(FDescontoAgricolaParam.MEFilial.text) <>'' then
         QRDescAgr.SetVariable('COD_FILIAL',FDescontoAgricolaParam.MEFilial.text)
       else
         QRDescAgr.SetVariable('COD_FILIAL',Null);
       QRDescAgr.Open;
       If FRDescAgricola_Descontos = nil then
          FRDescAgricola_Descontos := TFRDescAgricola_Descontos.Create(Application);
       FRDescAgricola_Descontos.QRLFilial.Caption := 'Filial:'+FDescontoAgricolaParam.MEDescFilial.text;
       if FDescontoAgricolaParam.RGPreview.ItemIndex = 0 then
          FRDescAgricola_Descontos.QRPrimario.Preview
       Else
          FRDescAgricola_Descontos.QRPrimario.Print;
       QRDescAgr.Close;
     End;
   End;
end;

procedure TFDescontoAgricolaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (3);
end;

procedure TFDescontoAgricolaCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMDescontoAgricola.QDescAgrCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFDescontoAgricolaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMDescontoAgricola.QDescAgr.Close;
  Action := CaFree;
  FDescontoAgricolaCad := Nil;
end;

procedure TFDescontoAgricolaCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMDescontoAgricola.QDescAgrCOD_FILIAL.Text),'AGRICOLA');
  inherited;
end;

procedure TFDescontoAgricolaCad.DuplicaTabelaDesconto1Click(
  Sender: TObject);
begin
  inherited;
  If FDescontoAgricolaDuplica = Nil Then
     FDescontoAgricolaDuplica := TFDescontoAgricolaDuplica.Create(Application);
  FDescontoAgricolaDuplica.ShowModal;

end;

procedure TFDescontoAgricolaCad.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit5.Text);
end;

end.
