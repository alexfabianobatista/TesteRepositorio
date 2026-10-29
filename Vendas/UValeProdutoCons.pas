unit UValeProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, DateUtils,
  ExtCtrls;

type
  TFValeProdutoCons = class(TFTConsulta)
    BtConsCadastro: TBitBtn;
    Label2: TLabel;
    Label11: TLabel;
    MENumNota: TMaskEdit;
    MEDataIni: TMaskEdit;
    Label3: TLabel;
    MEDataFin: TMaskEdit;
    Label4: TLabel;
    RGSituacao: TRadioGroup;
    RGTipoVale: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure METextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FValeProdutoCons: TFValeProdutoCons;

implementation

uses UDevolucaoTroca_cl, UCadastroCons, UCadastro_cl, UOracle_cl;

{$R *.dfm}

procedure TFValeProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMDevolucaoTroca do
  begin
    QValeProdutoCons.Close;
    QValeProdutoCons.ClearVariables;
    if (Trim(MEDataIni.Text) <> '') and
       (Trim(MEDataFin.Text) <> '') then
    begin
      QValeProdutoCons.SetVariable('DT_INICIAL', MEDataIni.Text);
      QValeProdutoCons.SetVariable('DT_FINAL', MEDataFin.Text);
    end;
    if Trim(MENumNota.Text) <> '' then
      QValeProdutoCons.SetVariable('NUM_NOTA', Trim(MENumNota.Text))
    else
      QValeProdutoCons.SetVariable('NUM_NOTA', null);
    If Trim(METexto.Text) <> '' Then
      QValeProdutoCons.SetVariable('COD_CADASTRO', trim(METexto.Text))
    else
      QValeProdutoCons.SetVariable('COD_CADASTRO', null);
    if RGTipoVale.ItemIndex = 0 then
    begin
      QValeProdutoCons.SetVariable('TIPO_VALE','VALE-COMPRAS');
      QValeProdutoCons.SetVariable('IND_VALIDO','S');
    end
    else
    begin
      QValeProdutoCons.SetVariable('TIPO_VALE','VALE-PRESENTE');
      if RGSituacao.ItemIndex = 3 then
        QValeProdutoCons.SetVariable('IND_SITUACAO',null)
      else
        QValeProdutoCons.SetVariable('IND_SITUACAO',RGSituacao.ItemIndex+1);
    end;
    QValeProdutoCons.Open;
  end;
end;

procedure TFValeProdutoCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFValeProdutoCons.METextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
    BtConsCadastro.Click;
end;

procedure TFValeProdutoCons.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if DMDevolucaoTroca.QValeProdutoConsIND_UTILIZADO.Value = 'S' then
    DBGrid1.Canvas.Brush.Color := clRed;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFValeProdutoCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEDataIni.Text := DateToStr(IncDay(DMOracle.DataServ, -30));
  MEDataFin.Text := DateToStr(DMOracle.DataServ);
end;

end.
