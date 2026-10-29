unit UContasReceberCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, ExtCtrls, StdCtrls, Buttons, Db, Grids, DBGrids, Mask,
  ActnList, Menus;

type
  TFContasReceberCons = class(TFTConsulta)
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label5: TLabel;
    MECodFinalidade: TMaskEdit;
    MECodAgencia: TMaskEdit;
    MECodFilial: TMaskEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    MEDataVencInicial: TMaskEdit;
    MEDataVencFinal: TMaskEdit;
    MEFilial: TMaskEdit;
    MEAgencia: TMaskEdit;
    RGSituacao: TRadioGroup;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    MEDataEmissaoInicial: TMaskEdit;
    MEDataEmissaoFinal: TMaskEdit;
    MEFinalidade: TMaskEdit;
    Label11: TLabel;
    MECodDepto: TMaskEdit;
    SpeedButton4: TSpeedButton;
    MEDepartamento: TMaskEdit;
    Label18: TLabel;
    MECodCliente: TMaskEdit;
    SpeedButton9: TSpeedButton;
    MeCadastro: TMaskEdit;
    Label12: TLabel;
    MeNrTitulo: TMaskEdit;
    Label13: TLabel;
    LblValor: TLabel;
    Label14: TLabel;
    MENosso_Num: TMaskEdit;
    Label15: TLabel;
    EdClassificacao: TLabel;
    Label2: TLabel;
    MeContrato: TMaskEdit;
    Label7: TLabel;
    LbContato: TLabel;
    Label16: TLabel;
    MeValor: TMaskEdit;
    RgOrdem: TRadioGroup;
    ActionList1: TActionList;
    AcConsultaCadastro: TAction;
    LblVendedor: TLabel;
    MeVendedor: TMaskEdit;
    SbVendedorCons: TSpeedButton;
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodAgenciaChange(Sender: TObject);
    procedure MECodFinalidadeChange(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MECodDeptoChange(Sender: TObject);
    procedure MECodClienteChange(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MeValorKeyPress(Sender: TObject; var Key: Char);
    procedure MECodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure AcConsultaCadastroExecute(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SbVendedorConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContasReceberCons: TFContasReceberCons;

implementation

uses UContasReceber_cl, UBancosCons, UBancoAgencia_cl, UFinalidadeCons,
  UFinalidade_cl, UFilialCons, UFilial_cl, UOracle_cl, UDepartamentoCons,
  UDepartamento_cl, UCadastroCons, UCadastro_cl, UUsuario_cl,
  UParamSistema_cl, UVendedorCons, UVendedor_cl;

{$R *.DFM}

procedure TFContasReceberCons.BtProcurarClick(Sender: TObject);
var
   // wdata_teste: TDate;
   wValor_Total : Real;
   wClassificacao : String;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(MECodFilial.Text,'CONTAS A RECEBER');
  With DMContasReceber do
    Begin
      QContasReceber_CabCons.Close;
      QContasReceber_CabCons.Sql.Clear;
      QContasReceber_CabCons.Sql.Add('SELECT Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,Tb_conta_receber_cab.COD_FINALIDADE,Tb_conta_receber_cab.COD_BANCO_AGENCIA,');
      QContasReceber_CabCons.Sql.Add('Tb_conta_receber_cab.COD_FILIAL,Tb_conta_receber_cab.NUM_TITULO,Tb_conta_receber_cab.NUM_PARCELA,');
      QContasReceber_CabCons.Sql.Add('Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,Tb_conta_receber_cab.DT_MOVIMENTO,Tb_conta_receber_cab.DT_BAIXA,');
      QContasReceber_CabCons.Sql.Add('Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.DT_CAPITALIZACAO,Tb_conta_receber_cab.DT_CAPITALIZACAO_MOEDA,');
      QContasReceber_CabCons.Sql.Add('Tb_conta_receber_cab.VAL_TITULO,Tb_conta_receber_cab.VAL_NEGOCIO,Tb_conta_receber_cab.IND_ACEITE,Tb_conta_receber_cab.VAL_JUROS,');
      QContasReceber_CabCons.Sql.Add('Tb_conta_receber_cab.IND_SITUACAO,Tb_conta_receber_cab.DESC_OBSERVACAO,Tb_conta_receber_cab.COD_NOTA_CAB,');
      QContasReceber_CabCons.Sql.Add('Tb_conta_receber_cab.COD_CADASTRO,Tb_conta_receber_cab.VAL_ORIGINAL,Tb_conta_receber_cab.COD_NOSSO_NUMERO,');
      QContasReceber_CabCons.Sql.Add('Tb_cadastro.NOME,TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.DESC_FANTASIA,TB_CADASTRO.NOME_CONTATO2,');
      QContasReceber_CabCons.Sql.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.PERC_JURO_MORA,TB_FINALIDADE.COD_MOEDA, ');
      QContasReceber_CabCons.Sql.Add('DECODE(Tb_conta_receber_cab.IND_SITUACAO,'+Chr(39)+'ABERTO'+Chr(39)+',TB_FINALIDADE.NUM_DIAS_CARENCIA,0) AS NUM_DIAS_CARENCIA, ');
      QContasReceber_CabCons.Sql.Add('TB_BANCO_AGENCIA.DESC_BANCO_AGENCIA ');
      QContasReceber_CabCons.Sql.Add('FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_FINALIDADE,TB_BANCO_AGENCIA ');
      QContasReceber_CabCons.Sql.Add(' WHERE (Tb_conta_receber_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ');
      QContasReceber_CabCons.Sql.Add(' AND (Tb_conta_receber_cab.COD_FINALIDADE = Tb_Finalidade.COD_FINALIDADE) ');
      QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA(+) ');
      If Trim(METexto.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CADASTRO.NUM_CGC_CPF = ' + chr(39) + Trim(METexto.Text) + chr(39));
      If Trim(MECodFinalidade.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE = ' + Trim(MECodFinalidade.Text));
      If Trim(MECodAgencia.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' + Trim(MECodAgencia.Text));
      If Trim(MECodFilial.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' + Trim(MECodFilial.Text));
      If Trim(MEDataEmissaoInicial.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO >= ' + 'To_Date('''+Trim(MEDataEmissaoInicial.Text)+''',''dd/mm/yyyy'')');
      If Trim(MEDataEmissaoFinal.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + 'To_Date('''+Trim(MEDataEmissaoFinal.Text)+''',''dd/mm/yyyy'')');
      case RGSituacao.ItemIndex of
        0:begin
          QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
          end;
        1:begin
          QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.IND_SITUACAO = ' + chr(39) + 'BAIXA TOTAL' + chr(39));
          end;
      end;
      if Trim(MECodCliente.Text) <> '' then
       Begin
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_CADASTRO = ' + Trim(MECodCliente.Text));
         wClassificacao := DMOracle.BuscaNome('SELECT COD_CLASS_CADASTRO FROM TB_CADASTRO','COD_CADASTRO = '+ Trim(MeCodCliente.Text));
         If wClassificacao <> '' Then
            EdClassificacao.Caption := DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = '+ wClassificacao);
       End;
      if Trim(MENrTitulo.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.NUM_TITULO = ' + Trim(MENrTitulo.Text));
      if Trim(MECodDepto.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO = ' + Trim(MECodDepto.Text));
      if Trim(MENosso_Num.text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO = ' + chr(39) + Trim(MENosso_Num.text) + chr(39));
      if Trim(MEContrato.text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTRATO_VEND = ' + chr(39) + Trim(MEContrato.text) + chr(39));
      if Trim(MEDataVencInicial.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + 'To_Date('''+Trim(MEDataVencInicial.Text)+''',''dd/mm/yyyy'')');
      if Trim(MEDataVencFinal.Text) <> '' then
         QContasReceber_CabCons.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + 'To_Date('''+Trim(MEDataVencFinal.Text)+''',''dd/mm/yyyy'')');
      if Trim(MeValor.text) <> '' Then
        if RGSituacao.ItemIndex = 1 then //quando a consulta for por contas baixadas e for informado valor, buscar pelo valor original
          QContasReceber_CabCons.Sql.Add(' AND VAL_ORIGINAL ='+Trim(MeValor.text))
        else
          QContasReceber_CabCons.Sql.Add(' AND VAL_TITULO ='+Trim(MeValor.text));
      Case RgOrdem.ItemIndex of
        0 : QContasReceber_CabCons.Sql.Add(' Order By TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        1 : QContasReceber_CabCons.Sql.Add(' Order By TB_CONTA_RECEBER_CAB.NUM_TITULO');
        2 : QContasReceber_CabCons.Sql.Add(' Order By TB_CADASTRO.NOME');
      End;
      QContasReceber_CabCons.Open;
      wValor_Total := 0;
      QContasReceber_CabCons.First;

      while Not QContasReceber_CabCons.Eof Do
      begin
        wValor_Total := wValor_Total + QContasReceber_CabConsVal_Titulo.Value;
        QContasReceber_CabCons.next;
      end;
      LblValor.Caption := FormatFloat('#,##0.00',wValor_Total);
      LbContato.Caption := QContasReceber_CabConsNome_Contato2.Value;
    end;
end;


procedure TFContasReceberCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
     MECodAgencia.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
end;

procedure TFContasReceberCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
     MECodFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
end;

procedure TFContasReceberCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
     MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberCons.MECodAgenciaChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodAgencia.Text)<>'' Then
    MEAgencia.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECodAgencia.Text)
  Else
    MEAgencia.Text:='';
end;

procedure TFContasReceberCons.MECodFinalidadeChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodFinalidade.Text)<>'' Then
    MEFinalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MECodFinalidade.Text)
  Else
    MEFinalidade.Text:='';
end;

procedure TFContasReceberCons.MECodFilialChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodFilial.Text)<>'' Then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  Else
    MEFilial.Text:='';
end;

procedure TFContasReceberCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    Begin
      MECodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    End;
end;

procedure TFContasReceberCons.MECodDeptoChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodDepto.Text)<>'' Then
    MEDepartamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+MECodDepto.Text)
  Else
    MEDepartamento.Text:='';
end;

procedure TFContasReceberCons.MECodClienteChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodCliente.Text)<>'' Then
    MECadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.Text)
  Else
    MECadastro.Text:='';

end;

procedure TFContasReceberCons.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      MECodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;

end;

procedure TFContasReceberCons.FormActivate(Sender: TObject);
begin
  inherited;
//  MEDataVencInicial.Text := DateToStr(Date() - 10);
//  MEDataVencFinal.Text := DateToStr(Date() + 10);
end;

procedure TFContasReceberCons.MeValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = ',' Then
     Key := '.';
end;

procedure TFContasReceberCons.MECodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if Key = 123 then //123 --> F12
//    SpeedButton9.Click;
end;

procedure TFContasReceberCons.FormCreate(Sender: TObject);
begin
  inherited;

  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' Then
  Begin
       //DEIXA INVISÍVEL OS COMPONENTES QUE NAO SERÃO USADOS
       Label1.Visible          := false;
       METexto.Visible         := false;
       Label16.Visible         := false;
       MeValor.Visible         := false;
       GroupBox2.Visible       := false;
       Label4.Visible          := false;
       MECodAgencia.Visible    := false;
       SpeedButton2.Visible    := false;
       MEAgencia.Visible       := false;
       Label11.Visible         := false;
       MECodDepto.Visible      := false;
       SpeedButton4.Visible    := false;
       MEDepartamento.Visible  := false;
       Label5.Visible          := false;
       MECodFilial.Visible     := false;
       SpeedButton3.Visible    := false;
       MEFilial.Visible        := false;
       Label3.Visible          := false;
       MECodFinalidade.Visible := false;
       SpeedButton1.Visible    := false;
       MEFinalidade.Visible    := false;
       Label12.Visible         := false;
       MeNrTitulo.Visible      := false;
       Label15.Visible         := false;
       MENosso_Num.Visible     := false;
       Label2.Visible          := false;
       MeContrato.Visible      := false;
       RgOrdem.Visible         := false;
       MeVendedor.Visible      := false;
       SbVendedorCons.Visible  := false;
       LblVendedor.Visible     := false;

       //ORGANIZA OS COMPONENTES QUE RESTARAM NA TELA
       RGSituacao.Left := 9;
       GroupBox1.Left  := 9;
       GroupBox1.Top   := 65;

  End;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') And
     (DMUsuario.pTipoFuncionario = 'VENDEDOR') Then
  Begin
     MeVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
     SbVendedorCons.Enabled := False;
     MeVendedor.Enabled := False;
  End;

end;

procedure TFContasReceberCons.AcConsultaCadastroExecute(Sender: TObject);
begin
  inherited;
  SpeedButton9.Click;
end;

procedure TFContasReceberCons.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'REMOVE' then
    with (Sender as TDBGrid) do
      with DMContasReceber do
      begin
        if (gdFocused in state) or (gdSelected in state) then
        begin
          Canvas.Brush.Color := clGray;
          Canvas.Font.Color := clWhite;
        end;
        if QContasReceber_CabConsIND_SITUACAO.Value = 'BAIXA TOTAL' then
          Canvas.Brush.Color := clGreen
        else if QContasReceber_CabConsDT_VENCIMENTO.Value < Date then
          Canvas.Brush.Color := clRed
        else if QContasReceber_CabConsDT_VENCIMENTO.Value = Date then
          Canvas.Brush.Color := clBlue;
        DefaultDrawColumnCell(Rect,DataCol,Column,state);
      end;
end;

procedure TFContasReceberCons.SbVendedorConsClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons=Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal=mrOk then
     MeVendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;

end;

end.
