unit UCaixaDetCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFCaixaDetCons = class(TFTConsulta)
    MEFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MEDepartamento: TMaskEdit;
    MECodDepto: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    CBTodosFilial: TCheckBox;
    CBTodosDepartamento: TCheckBox;
    GroupBox1: TGroupBox;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure MECodDeptoChange(Sender: TObject);
    procedure CBTodosFilialClick(Sender: TObject);
    procedure CBTodosDepartamentoClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixaDetCons: TFCaixaDetCons;

implementation

uses UFilialCons, UFilial_cl, UDepartamentoCons, UDepartamento_cl,
  UOracle_cl, UCaixa_cl, UUsuario_cl;

{$R *.DFM}

procedure TFCaixaDetCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    METexto.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFCaixaDetCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=MrOk then
    MECodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFCaixaDetCons.METextoChange(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text)<>'' then
    begin
      MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+METexto.Text);
      CBTodosFilial.Checked:=False;
    end
  else
    begin
      MEFilial.Clear;
      CBTodosFilial.Checked:=True;
    end;
end;

procedure TFCaixaDetCons.MECodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodDepto.Text)<>'' then
    begin
      MEDepartamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MECodDepto.Text);
      CBTodosDepartamento.Checked:=False;
    end
  else
    begin
      MEDepartamento.Clear;
      CBTodosDepartamento.Checked:=True;
    end;
end;

procedure TFCaixaDetCons.CBTodosFilialClick(Sender: TObject);
begin
  inherited;
  If CBTodosFilial.Checked then
    METexto.Clear;
end;

procedure TFCaixaDetCons.CBTodosDepartamentoClick(Sender: TObject);
begin
  inherited;
  If CBTodosDepartamento.Checked then
    MECodDepto.Clear;
end;

procedure TFCaixaDetCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
    DmUsuario.Checar_Filial_Usuario(METexto.Text,'CAIXA');
    with DMCaixa do
    begin
      QCaixaDet_Cons.Close;
      if Trim(METexto.Text) <> '' then
        QCaixaDet_Cons.SetVariable('COD_FILIAL',StrToInt(Trim(METexto.Text)))
      else
        QCaixaDet_Cons.SetVariable('COD_FILIAL',Null);

      if Trim(MECodDepto.Text) <> '' then
        QCaixaDet_Cons.SetVariable('COD_DEPARTAMENTO',StrToInt(Trim(MECodDepto.Text)))
      else
        QCaixaDet_Cons.SetVariable('COD_DEPARTAMENTO',Null);

      if Trim(MEDTInicial.Text) <> '' then
        QCaixaDet_Cons.SetVariable('DT_INICIAL',StrToDate(MEDTInicial.Text))
      else
        QCaixaDet_Cons.SetVariable('DT_INICIAL',Null);

      if Trim(MEDTFinal.Text) <> '' then
        QCaixaDet_Cons.SetVariable('DT_FINAL',StrToDate(MEDTFinal.Text))
      else
        QCaixaDet_Cons.SetVariable('DT_FINAL',Null);
      QCaixaDet_Cons.Open;
    end;
end;

end.
