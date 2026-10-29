unit URomaneioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Variants, Menus;

type
  TFRomaneioCons = class(TFTConsulta)
    Label2: TLabel;
    Label3: TLabel;
    MeDtFinal: TMaskEdit;
    MeDtInicial: TMaskEdit;
    Label4: TLabel;
    MeCadastro: TMaskEdit;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    MeProduto: TMaskEdit;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    MeFilial: TMaskEdit;
    BtFilial: TBitBtn;
    Label7: TLabel;
    MePlaca: TMaskEdit;
    CbTipo: TComboBox;
    procedure BtProcurarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRomaneioCons: TFRomaneioCons;

implementation

uses URomaneioAgricola_cl, UCadastro_cl, UCadastroCons, UProduto_cl,
  UProdutoCons, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFRomaneioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMRomaneioAgricola do
  begin
    QRomaneioCons.Close;
    if Trim(MeTexto.Text) = '' then
       qRomaneioCons.SetVariable('NumRomaneio',Null)
    else
       QRomaneioCons.SetVariable('NumRomaneio',MeTexto.Text);
    if Trim(MeDtInicial.Text) = '' then
       QRomaneioCons.SetVariable('Datai',Null)
    else
       QRomaneioCons.SetVariable('DataI',strToDate(MeDtInicial.Text));
    if Trim(MeDtFinal.Text) = '' then
       qRomaneioCons.SetVariable('Dataf',Null)
    else
       QRomaneioCons.SetVariable('Dataf',strToDate(MeDtFinal.Text));
    if Trim(MeCadastro.Text) = '' then
       QRomaneioCons.SetVariable('Cod_Cadastro',Null)
    else
       QRomaneioCons.SetVariable('Cod_Cadastro',MeCadastro.Text);
    if Trim(MeFilial.Text) = '' then
       QRomaneioCons.SetVariable('Cod_Filial',Null)
    else
       QRomaneioCons.SetVariable('Cod_Filial',Trim(MeFilial.Text));
    if Trim(MeProduto.Text) = '' then
       QRomaneioCons.SetVariable('CodProduto',Null)
    else
       QRomaneioCons.SetVariable('CodProduto',MeProduto.Text);
    if Trim(MePlaca.Text) = '' then
       QRomaneioCons.SetVariable('DESC_PLACA',Null)
    else
       QRomaneioCons.SetVariable('DESC_PLACA',Trim(MePlaca.Text));
    Case CbTipo.ItemIndex Of
      0 : QRomaneioCons.SetVariable('IND_TIPO_ROMANEIO',Null);
      1 : QRomaneioCons.SetVariable('IND_TIPO_ROMANEIO','ROMANEIO');
      2 : QRomaneioCons.SetVariable('IND_TIPO_ROMANEIO','PESAGEM EN');
      3 : QRomaneioCons.SetVariable('IND_TIPO_ROMANEIO','PESAGEM SA');
      4 : QRomaneioCons.SetVariable('IND_TIPO_ROMANEIO','PESAGEM PA');
    End;
    QRomaneioCons.Open;
  end;
end;

procedure TFRomaneioCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFRomaneioCons.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFRomaneioCons.FormActivate(Sender: TObject);
begin
  inherited;
//  MeDtInicial.Text := DateToStr(Date - 5);
// MeDtFinal.Text := DateToStr(Date);
end;

procedure TFRomaneioCons.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFRomaneioCons.FormCreate(Sender: TObject);
begin
  inherited;
  MeDtInicial.Text := DateToStr(Date);
  MeDtFinal.Text := DateToStr(Date);
end;

end.
