unit UContratoVendCustoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFContratoVendCustoCons = class(TFTConsulta)
    Label2: TLabel;
    Label3: TLabel;
    MeData_I: TMaskEdit;
    MeData_F: TMaskEdit;
    Label4: TLabel;
    MeFilial: TMaskEdit;
    BitBtn1: TBitBtn;
    EdFilial: TEdit;
    Label5: TLabel;
    MeProduto: TMaskEdit;
    BitBtn3: TBitBtn;
    EdProduto: TEdit;
    RgOpcao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoVendCustoCons: TFContratoVendCustoCons;

implementation

uses UContrato_Vend_Cl, Ucontrato_cl, UOracle_cl, UFilialCons, UFilial_cl,
  UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFContratoVendCustoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMContrato_Vend do
   begin
     QContrato_Vend_Custos_Cons.Close;
     if Trim(Metexto.Text)<>'' then
       QContrato_Vend_Custos_Cons.SetVariable('COD_CONTRATO_VEND',MEtexto.Text)
     else
       QContrato_Vend_Custos_Cons.SetVariable('COD_CONTRATO_VEND',Null);
     if Trim(MeFilial.Text)<>'' then
       QContrato_Vend_Custos_Cons.SetVariable('COD_FILIAL',Trim(MeFilial.Text))
     else
       QContrato_Vend_Custos_Cons.SetVariable('COD_FILIAL',Null);
     if Trim(MeProduto.Text)<>'' then
       QContrato_Vend_Custos_Cons.SetVariable('COD_PRODUTO',Trim(MeProduto.Text))
     else
       QContrato_Vend_Custos_Cons.SetVariable('COD_FILIAL',Null);
     QContrato_Vend_Custos_Cons.SetVariable('DATA_I',MEData_I.Text);
     QContrato_Vend_Custos_Cons.SetVariable('DATA_F',MEData_F.Text);
     QContrato_Vend_Custos_Cons.SQL[QContrato_Vend_Custos_Cons.SQL.Count-1] := '';
     Case RgOpcao.ItemIndex of
       0 : QContrato_Vend_Custos_Cons.SQL.Add(' And Qtde_Saldo = 0');
       1 : QContrato_Vend_Custos_Cons.SQL.Add(' And Qtde_Saldo <> 0');
     End;  
     QContrato_Vend_Custos_Cons.Open;
   end;
end;

procedure TFContratoVendCustoCons.MeFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.text)
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFContratoVendCustoCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
     MEFilialExit(Self);
  end;

end;

procedure TFContratoVendCustoCons.MeProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(MEProduto.Text) <> '' Then
     EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MEProduto.text)
  Else
    EdProduto.Text := 'Todos';

end;

procedure TFContratoVendCustoCons.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     MeProdutoExit(Self);
  end;

end;

end.
