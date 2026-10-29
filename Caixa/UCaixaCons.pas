unit UCaixaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFCaixaCons = class(TFTConsulta)
    MECodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MEFilial: TMaskEdit;
    Label2: TLabel;
    MECodDepto: TMaskEdit;
    MEDepartamento: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MECodHistorico: TMaskEdit;
    SpeedButton3: TSpeedButton;
    MEHistorico: TMaskEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MEDTInicial: TMaskEdit;
    MEDTFinal: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    MeValor: TMaskEdit;
    MeNumDoc: TMaskEdit;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    EdCadastro: TEdit;
    Label8: TLabel;
    LblValor: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure MECodDeptoChange(Sender: TObject);
    procedure MECodHistoricoChange(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure METextoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixaCons: TFCaixaCons;

implementation

uses UFilialCons, UFilial_cl, UDepartamentoCons, UDepartamento_cl,
  UHistoricoCons, UHistorico_cl, UOracle_cl, UCaixa_cl, UParamSistema_cl,
  UUsuario_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFCaixaCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFCaixaCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=MrOk then
    MECodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFCaixaCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=MrOk then
    MECodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
end;

procedure TFCaixaCons.MECodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text)<>'' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
    MEFilial.Clear;
end;

procedure TFCaixaCons.MECodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodDepto.Text)<>'' then
    MEDepartamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MECodDepto.Text)
  else
    MEDepartamento.Clear;
end;

procedure TFCaixaCons.MECodHistoricoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodHistorico.Text)<>'' then
    MEHistorico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+MECodHistorico.Text)
  else
    MEHistorico.Clear;
end;

procedure TFCaixaCons.BtProcurarClick(Sender: TObject);
var
wValorTotal : real;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(Trim(MeCodFilial.Text),'CAIXA');
  with DMCaixa do
    begin
      QCaixa_Mov_Cons.Close;
      if Trim(METexto.Text) <> '' then
        QCaixa_Mov_Cons.SetVariable('COD_CADASTRO',Trim(METexto.Text))
      else
        QCaixa_Mov_Cons.SetVariable('COD_CADASTRO',Null);
      if Trim(MECodFilial.Text) <> '' then
        QCaixa_Mov_Cons.SetVariable('COD_FILIAL',StrToInt(Trim(MECodFilial.Text)))
      else
        QCaixa_Mov_Cons.SetVariable('COD_FILIAL',Null);

      if Trim(MECodDepto.Text) <> '' then
        QCaixa_Mov_Cons.SetVariable('COD_DEPARTAMENTO',StrToInt(Trim(MECodDepto.Text)))
      else
        QCaixa_Mov_Cons.SetVariable('COD_DEPARTAMENTO',Null);

      if Trim(MECodHistorico.Text) <> '' then
        QCaixa_Mov_Cons.SetVariable('COD_HISTORICO',StrToInt(Trim(MECodHistorico.Text)))
      else
        QCaixa_Mov_Cons.SetVariable('COD_HISTORICO',Null);

      if Trim(MENumDoc.Text) <> '' then
        QCaixa_Mov_Cons.SetVariable('NUM_DOC',StrToInt(Trim(MENumDoc.Text)))
      else
        QCaixa_Mov_Cons.SetVariable('NUM_DOC',Null);

      if Trim(MEDTInicial.Text) = '' then
         Raise Exception.Create ('Campo Data Inicial Deve Ser Informado');
      QCaixa_Mov_Cons.SetVariable('DT_INICIAL',StrToDate(MEDTInicial.Text));

      if Trim(MEDTFinal.Text) = '' then
         Raise Exception.Create ('Campo Data Final Deve Ser Informado');
      QCaixa_Mov_Cons.SetVariable('DT_FINAL',StrToDate(MEDTFinal.Text));

      if Trim(MeValor.Text) <> '' then
        QCaixa_Mov_Cons.SetVariable('VAL_MOVIMENTO',StrToFloat(Trim(MeValor.Text)))
      else
        QCaixa_Mov_Cons.SetVariable('VAL_MOVIMENTO',Null);


      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONSTRUIR' then
          QCaixa_Mov_Cons.SQl.Add(' ,Tb_caixa_mov.COD_DEPARTAMENTO,TB_CAIXA_MOV.COD_CAIXA_MOV');


      QCaixa_Mov_Cons.Open;

      wValorTotal := 0;
      QCaixa_Mov_Cons.First;
      while Not QCaixa_Mov_Cons.Eof Do
      begin
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MALAGGI' then
          wValorTotal := wValorTotal + QCaixa_Mov_ConsVAL_VARIACAO.Value
        else
          wValorTotal := wValorTotal + QCaixa_Mov_ConsVAL_MOVIMENTO.Value;
        QCaixa_Mov_Cons.next;
      end;
      LblValor.Caption := FormatFloat('#,##0.00',wValorTotal);
    end;
end;

procedure TFCaixaCons.FormActivate(Sender: TObject);
begin
  inherited;
  MeDtInicial.Text := DateToStr(Date());
  MeDtFinal.Text := DateToStr(Date());
end;

procedure TFCaixaCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=MrOk then
    METexto.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    METextoExit(self);
end;

procedure TFCaixaCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text)<>'' then
    EdCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+METexto.Text)
  else
    EdCadastro.Text := 'Todos';   
end;

end.
