unit UPrecoAgricolaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFPrecoAgricolaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BtConsProduto: TBitBtn;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    BtConsFilial: TBitBtn;
    RelaodePreosAgrcolas1: TMenuItem;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    BtConsLote: TBitBtn;
    DBDirceu3: TDBDirceu;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    procedure BtConsProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure SBVeiculoClick2(Sender: TObject);
    procedure RelaodePreosAgrcolas1Click(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoAgricolaCad: TFPrecoAgricolaCad;

implementation

uses UPrecoAgricola_cl, UProdutoCons, UProduto_cl, UPrecoAgricolaCons,
  UFilialCons, UFilial_cl, UDescontoAgricolaParam, UUsuario_cl, UOracle_cl,
  URDescontoAgricola_Desconto, URPrecoAgricola, UTipoLoteCons, UTipoLote_cl;

{$R *.DFM}

procedure TFPrecoAgricolaCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     DMPrecoAgricola.QPrecoAgricolaCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
end;

procedure TFPrecoAgricolaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPrecoAgricola.QPrecoAgricola.Open;
end;

procedure TFPrecoAgricolaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPrecoAgricola.QPrecoAgricola.Close;
end;

procedure TFPrecoAgricolaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPrecoAgricolaCons = nil then
     FPrecoAgricolaCons := TFPrecoAgricolaCons.Create(Application);
  If FPrecoAgricolaCons.ShowModal = mrOK then
     with DMPrecoAgricola do
     begin
        QPrecoAgricola.Close;
        QPrecoAgricola.setVariable('PK',QPrecoAgricola_ConsCod_Preco_Agricola.Value);
        QPrecoAgricola.Open;
     end;

end;

procedure TFPrecoAgricolaCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMPrecoAgricola.QPrecoAgricolaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFPrecoAgricolaCad.SBVeiculoClick(Sender: TObject);
begin
  inherited;
 // if FVeiculoCons = nil then
 //   FVeiculoCons := TFVeiculoCons.Create(Application);
 // if FVeiculoCons.ShowModal = mrOk then
 //   DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_VEICULO.Value := DMVeiculo.QVeiculoConsCOD_VEICULO.Value;
end;

procedure TFPrecoAgricolaCad.SBVeiculoClick2(Sender: TObject);
begin
  inherited;
  //if FVeiculoCons = nil then
  //  FVeiculoCons := TFVeiculoCons.Create(Application);
  //if FVeiculoCons.ShowModal = mrOk then
  //  DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_VEICULO.Value := DMVeiculo.QVeiculoConsCOD_VEICULO.Value;
end;

procedure TFPrecoAgricolaCad.RelaodePreosAgrcolas1Click(Sender: TObject);
begin
  inherited;
  if FDescontoAgricolaParam = Nil then
    FDescontoAgricolaParam:= TFDescontoAgricolaParam.Create(Application);
  FDescontoAgricolaParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FDescontoAgricolaParam.ShowModal =  mrOk then
   Begin
     DmUsuario.Checar_Filial_Usuario( Trim(FDescontoAgricolaParam.MEFilial.Text),'AGRICOLA');
     With DMPrecoAgricola do
     Begin
       QRPrecoAgricola.Close;
       if Trim(FDescontoAgricolaParam.ME1Produto.text) <>'' then
         QRPrecoAgricola.SetVariable('PRODUTO',FDescontoAgricolaParam.ME1Produto.text)
       else
         QRPrecoAgricola.SetVariable('PRODUTO',Null);
       if Trim(FDescontoAgricolaParam.ME1Filial.text) <>'' then
         QRPrecoAgricola.SetVariable('FILIAL',FDescontoAgricolaParam.ME1Filial.text)
       else
         QRPrecoAgricola.SetVariable('FILIAL',Null);
       if (FDescontoAgricolaParam.ME1Dt_inicial.Text = '') or (FDescontoAgricolaParam.ME1Dt_Final.Text = '') then
         Raise Exception.Create('É Preciso Informar o Período')
       else
         QRPrecoAgricola.SetVariable('DATA_I',FDescontoAgricolaParam.ME1Dt_Inicial.Text);
         QRPrecoAgricola.SetVariable('DATA_F',FDescontoAgricolaParam.ME1Dt_Final.Text);
       QRPrecoAgricola.Open;
       If FRPrecoAgricola = nil then
          FRPrecoAgricola := TFRPrecoAgricola.Create(Application);
       FRPrecoAgricola.QRLFilial.Caption := 'Filial:'+FDescontoAgricolaParam.Ed1Filial.text;
       FRPrecoAgricola.QRLPeriodo.Caption := 'Periodo:'+FDescontoAgricolaParam.ME1Dt_Inicial.text+ ' Até '+FDescontoAgricolaParam.ME1Dt_Final.text;
       if FDescontoAgricolaParam.RGPreview.ItemIndex = 0 then
          FRPrecoAgricola.QRPrimario.Preview
       Else
          FRPrecoAgricola.QRPrimario.Print;
       QRPrecoAgricola.Close;
     End;
   End;

end;

procedure TFPrecoAgricolaCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = nil then
     FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOK then
     DMPrecoAgricola.QPrecoAgricolaCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
end;

procedure TFPrecoAgricolaCad.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit8.Text);
end;

end.
