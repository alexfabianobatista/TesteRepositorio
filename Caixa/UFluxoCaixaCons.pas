unit UFluxoCaixaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFFluxoCaixaCons = class(TFTConsulta)
    SpeedButton2: TSpeedButton;
    MEDepartamento: TMaskEdit;
    MECodDepto: TMaskEdit;
    Label3: TLabel;
    MEFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    MEDTInicial: TMaskEdit;
    MEDTFinal: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure MECodDeptoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFluxoCaixaCons: TFFluxoCaixaCons;

implementation

uses UFilialCons, UDepartamentoCons, UOracle_cl, UFilial_cl,
  UDepartamento_cl, UUsuario_cl, UFluxoCaixa_cl;

{$R *.DFM}

procedure TFFluxoCaixaCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
  Begin
    METexto.Text:= DMFilial.QFilialConsCOD_FILIAL.Text;
    MEFilial.Text := DMFilial.QFilialConsDESC_FILIAL.Text;
  End

end;

procedure TFFluxoCaixaCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=MrOk then
  Begin
    MECodDepto.Text:= DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
    MEDepartamento.Text:= DMDepartamento.QDepartamentoConsDESC_DEPARTAMENTO.Text;
  End;

end;

procedure TFFluxoCaixaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(METexto.Text,'CAIXA'); //SEGURANÇA FILIAL

  If (Trim(MEDTInicial.Text) = '') OR (Trim(MEDTFinal.Text) = '') then
    raise exception.Create('Deve ser informado período de movimentação!');

  DMFluxoCaixa.QFluxo_Caixa_Cons.Close;
  If Trim(METexto.Text) <> '' then
    DMFluxoCaixa.QFluxo_Caixa_Cons.SetVariable('COD_FILIAL',METexto.Text)
  else
    DMFluxoCaixa.QFluxo_Caixa_Cons.SetVariable('COD_FILIAL',Null);

  If Trim(MECodDepto.Text) <> '' then
    DMFluxoCaixa.QFluxo_Caixa_Cons.SetVariable('COD_DEPTO', MECodDepto.Text)
  else
    DMFluxoCaixa.QFluxo_Caixa_Cons.SetVariable('COD_DEPTO', Null);

  If Trim(MEDTInicial.Text) <> '' then
    DMFluxoCaixa.QFluxo_Caixa_Cons.SetVariable('DT_INI', MEDTInicial.Text)
  else
    DMFluxoCaixa.QFluxo_Caixa_Cons.SetVariable('DT_INI', Null);

  If Trim(MEDTFinal.Text) <> '' then
    DMFluxoCaixa.QFluxo_Caixa_Cons.SetVariable('DT_FIM', MEDTFinal.Text)
  else
    DMFluxoCaixa.QFluxo_Caixa_Cons.SetVariable('DT_FIM', Null);
  DMFluxoCaixa.QFluxo_Caixa_Cons.Open;

end;

procedure TFFluxoCaixaCons.METextoChange(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text)<>'' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+METexto.Text)
  else
    MEFilial.Clear;

end;

procedure TFFluxoCaixaCons.MECodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodDepto.Text)<>'' then
    MEDepartamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MECodDepto.Text)
  else
    MEDepartamento.Clear;

end;

end.
