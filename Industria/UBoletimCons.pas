unit UBoletimCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus, UFmProduto;

type
  TFBoletimCons = class(TFTConsulta)
    MEDataI: TMaskEdit;
    Label2: TLabel;
    MEDataF: TMaskEdit;
    Label3: TLabel;
    METurno: TMaskEdit;
    Label4: TLabel;
    BtConsTurno: TBitBtn;
    EdTipo_Boletim: TEdit;
    BtConsFilial: TBitBtn;
    RgSituacao: TRadioGroup;
    FmProduto1: TFmProduto;
    BtFormula: TBitBtn;
    EdFormula: TEdit;
    Label5: TLabel;
    MEFormula: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsTurnoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MEFormulaExit(Sender: TObject);
    procedure BtFormulaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBoletimCons: TFBoletimCons;

implementation

uses UBoletim_cl, UTurnoCons, UTurno_cl, UFilialCons, UFilial_cl,
  UFormulaCons, UFormula_cl, UOracle_cl;

{$R *.DFM}

procedure TFBoletimCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMBoletim do
  Begin
    QBoletimCons.Close;
    QBoletimCons.SetVariable('DATA_I',StrToDate(MEDataI.Text));
    QBoletimCons.SetVariable('DATA_F',StrToDate(MEDataF.Text));
    If Trim(EdTipo_Boletim.Text) = '' Then
      QBoletimCons.SetVariable('TIPO_BOLETIM',Null)
    Else
      QBoletimCons.SetVariable('TIPO_BOLETIM',Trim(EdTipo_Boletim.Text));
    If Trim(METexto.Text) = '' then
      QBoletimCons.SetVariable('FILIAL',Null)
    Else
      QBoletimCons.SetVariable('FILIAL',METexto.Text);
    If Trim(METurno.Text) = '' then
      QBoletimCons.SetVariable('TURNO',Null)
    Else
      QBoletimCons.SetVariable('TURNO',METurno.Text);
      
    if RgSituacao.ItemIndex = 0 then
      QBoletimCons.SetVariable('IND_SITUACAO',1)
    Else
    if RgSituacao.ItemIndex = 1 then
      QBoletimCons.SetVariable('IND_SITUACAO',2)
    Else
    if RgSituacao.ItemIndex = 2 then
      QBoletimCons.SetVariable('IND_SITUACAO',3)
    Else
    if RgSituacao.ItemIndex = 3 then
      QBoletimCons.SetVariable('IND_SITUACAO',null);
    if Trim(FmProduto1.MeProduto.Text) = '' then
      QBoletimCons.SetVariable('PRODUTO', null)
    else
      QBoletimCons.SetVariable('PRODUTO', trim(FmProduto1.MeProduto.Text));
    if Trim(MEFormula.Text) = '' then
      QBoletimCons.SetVariable('FORMULA', null)
    else
      QBoletimCons.SetVariable('FORMULA',Trim(MEFormula.Text));
    QBoletimCons.Open;
  End;
end;

procedure TFBoletimCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDataI.Text := DateToStr(Date-10);
  MEDataF.Text := DateToStr(Date);
end;

procedure TFBoletimCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  With DMBoletim do
    MeTexto.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFBoletimCons.BtConsTurnoClick(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
    METurno.Text := DMTurno.QTurnoAllCod_Turno.Text;

end;

procedure TFBoletimCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EdTipo_Boletim.Clear;
end;

procedure TFBoletimCons.MEFormulaExit(Sender: TObject);
begin
  inherited;
  if trim(MEFormula.Text) <> '' then
  begin
    EdFormula.Text := dmOracle.FastSelect('P.DESC_PRODUTO'
      ,'TB_PRODUTO P INNER JOIN TB_FORMULA F ON P.COD_PRODUTO = F.COD_PRODUTO'
      ,'COD_FORMULA = ' + trim(MEFormula.Text));
  end
  else
    EdFormula.Text := 'Todas';
end;

procedure TFBoletimCons.BtFormulaClick(Sender: TObject);
begin
  inherited;
  if FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  if FFormulaCons.ShowModal = MrOk then
  begin
    MEFormula.Text := DMFormula.QFormulaConsCOD_FORMULA.Text;
    MEFormulaExit(self);
  end;
end;

end.
