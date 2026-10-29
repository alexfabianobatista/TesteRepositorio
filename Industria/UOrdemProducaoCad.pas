unit UOrdemProducaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, clipbrd, variants, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOrdemProducaoCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DSOrdemProducaoItem: TDataSource;
    Opes1: TMenuItem;
    Confirmar2: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    BaixarOrdem1: TMenuItem;
    OrdemdeProduo1: TMenuItem;
    EtiquetaProdAcabado1: TMenuItem;
    DBRadioGroup2: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    LanarComponentes1: TMenuItem;
    procedure Confirmar2Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BaixarOrdem1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OrdemdeProduo1Click(Sender: TObject);
    procedure EtiquetaProdAcabado1Click(Sender: TObject);
    procedure MELocalizaClick(Sender: TObject);
    procedure MELocalizaChange(Sender: TObject);
    procedure LanarComponentes1Click(Sender: TObject);
  private
    { Private declarations }
    function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;

  public
    { Public declarations }
  end;

var
  FOrdemProducaoCad: TFOrdemProducaoCad;

implementation

uses UOrdemProducao_cl, URComponenteProducao, UOracle_cl,
  UOrdemProducaoCons, UEstoque_cl, UFormulaParam, UFormula_cl,
  URFormula_Relacao, UParamSistema_cl, UBiblioteca, UREtiquetaProdAcabado,
  URComponenteProducao1, USequencia_cl, ULancaComponente, UTeste;

{$R *.DFM}

function TFOrdemProducaoCad.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin
  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];

  while Length(S) < Zeros do
      S := '0' + S;

  Result := S;
end;

procedure TFOrdemProducaoCad.Confirmar2Click(Sender: TObject);
var wUsuario : string;
begin
  inherited;
  with DMOrdemProducao do
  Begin
    if ((QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB.Text <> '') and (QOrdemProducao_cabIND_SITUACAO.text = '1')) then
    Begin
      If QOrdemProducao_cabDESC_TIPO_ORDEM.Value = 'PINTURA' Then
      Begin
        QOrdemProducao_cab.Edit;
        QOrdemProducao_cabIND_SITUACAO.Value := '2';//esta sendo produzido
        QOrdemProducao_cab.Post;
        DMOracle.DBCemapa.Commit;
        QRComponenteProducao.Close;
        If QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB.Text <> '' Then
          QRComponenteProducao.SetVariable('ORDEM',QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB.Value)
        Else
          raise Exception.Create('Selecione uma ordem de produção!');
        QRComponenteProducao.Open;

        //if QOrdemProducao_cabDESC_TIPO_ORDEM.Value = 'PINTURA' Then
        //Begin
        QProduto_Comprometido.close;
        QProduto_comprometido.SetVariable('ORDEM',QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB.Value);
        QProduto_Comprometido.Open;
        QProduto_Comprometido.first;
          while not QProduto_Comprometido.EOF do
          Begin
            DMOracle.QExecSQL.Close;
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('UPDATE TB_ESTOQUE SET QT_COMPROMETIDO = NVL(QT_COMPROMETIDO,0) +' + QProduto_ComprometidoQT_COMPROMETIDO.Text);
            DMOracle.QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + QProduto_ComprometidoCOD_PRODUTO.Text);
            If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
              DMOracle.QExecSQL.SQL.Add('AND COD_LOTE_TIPO = 310')
            else
              DMOracle.QExecSQL.SQL.Add('AND COD_LOTE_TIPO = 1');
            DMOracle.QExecSQL.ExecSQL;
            QProduto_Comprometido.Next;
          end;
        DMOracle.DBCemapa.commit;
        //end;
        If FRComponenteProducao = Nil then
          FRComponenteProducao := TFRComponenteProducao.Create(Application);
        FRComponenteProducao.QRLTitulo.Caption := 'Componentes para a Ordem de Produção Nº' + IntToStr(QRComponenteProducaoCOD_ORDEM_PRODUCAO_CAB.Value);
        wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO ='+ IntToStr(QOrdemProducao_CabCOD_USUARIO.Value));
        FRComponenteProducao.QRLusuario.Caption := 'Usuário: ' + IntToStr(QOrdemProducao_CabCOD_USUARIO.Value)+ ' ' + wUsuario;
        FRComponenteProducao.QRLPeriodo.Caption := 'Período :' + QOrdemProducao_CabDT_PERIODO_I.Text + ' Até ' + QOrdemProducao_CabDT_PERIODO_F.Text;
        FRComponenteProducao.QRPrimario.Preview;
      end
      else
      Begin //PRODUCAO-CORTE
        QOrdemProducao_cab.Edit;
        QOrdemProducao_cabIND_SITUACAO.Value := '2';//esta sendo produzido
        QOrdemProducao_cab.Post;
        DMOracle.DBCemapa.Commit;
        QRComponenteProducao1.Close;
        If QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB.Text <> '' Then
          QRComponenteProducao1.SetVariable('ORDEM',QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB.Value)
        Else
          raise Exception.Create('Selecione uma ordem de produção!');
        QRComponenteProducao1.Open;

        If FRComponenteProducao1 = Nil then
          FRComponenteProducao1 := TFRComponenteProducao1.Create(Application);
          FRComponenteProducao1.QRLTitulo.Caption := 'Componentes para a Ordem de Produção Nº' + IntToStr(QRComponenteProducao1COD_ORDEM_PRODUCAO_CAB.Value);
          wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO ='+ IntToStr(QOrdemProducao_CabCOD_USUARIO.Value));
          FRComponenteProducao1.QRLusuario.Caption := 'Usuário: ' + IntToStr(QOrdemProducao_CabCOD_USUARIO.Value)+ ' ' + wUsuario;
          FRComponenteProducao1.QRPrimario.Preview;
      end;
    end
    else
      Raise Exception.Create('Selecione uma ordem de Produção à Produzir!');
  end;
end;

procedure TFOrdemProducaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FOrdemProducaoCons = Nil then
    FOrdemProducaoCons := TFOrdemProducaoCons.Create(Application);
  If FOrdemProducaoCons.ShowModal = mrOk then
  With DMOrdemProducao do
  Begin
    QOrdemProducao_Cab.Close;
    QOrdemProducao_Cab.SetVariable('PK',QOrdemProducaoConsCod_Ordem_producao_cab.Value);
    QOrdemProducao_Cab.Open;
    QOrdemProducao_Item.Close;
    QOrdemProducao_Item.SetVariable('ORDEM_PRODUCAO_CAB',QOrdemProducaoConsCod_Ordem_producao_cab.Value);
    QOrdemProducao_Item.Open;
  End;

end;

procedure TFOrdemProducaoCad.BaixarOrdem1Click(Sender: TObject);
begin
  inherited;
  with DMOrdemProducao do
  Begin
    if ((QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB.Text <> '') and (QOrdemProducao_cabIND_SITUACAO.text = '2')
        and (QOrdemProducao_CabDESC_TIPO_ORDEM.Text = 'PRODUCAO')) Then
    Begin   
      QOrdemProducao_cab.Edit;
      QOrdemProducao_cabIND_SITUACAO.Value := '3';//implantado no estoque
      QOrdemProducao_cab.Post;
      DMOracle.DBCemapa.Commit;
      //QRComponenteProducao.Close;
      //QRComponenteProducao.SetVariable('ORDEM',QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB.Value);
      //QRComponenteProducao.Open;
      //QRComponenteProducao.First;
     //while not QRComponenteProducao.Eof do  //faz entrada de componentes no estoque
      //Begin
        //DMEstoque.AtualizaEstoque(-1,1,QRComponenteProducaoCOD_PRODUTO.Value,
        //                          310,QRComponenteProducaoQT_QUANTIDADE.Value,0,0,0);
        //QRComponenteProducao.Next;
      //end;
      //DMOracle.DBCemapa.Commit;
      //showmessage('Ordem de Produção incluida no Estoque com Sucesso!');
    end
    else
    IF QOrdemProducao_CabDESC_TIPO_ORDEM.Text = 'PINTURA' then
    Begin
      QOrdemProducao_cab.Edit;
      QOrdemProducao_cabIND_SITUACAO.Value := '3';
      QOrdemProducao_cab.Post;
      DMOracle.DBCemapa.Commit; 
    end
    else
      Raise Exception.Create('Selecione uma ordem de Produção!');
  end;
end;

procedure TFOrdemProducaoCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFOrdemProducaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMOrdemProducao.QOrdemProducao_Cab .Close;
  DMOrdemproducao.QOrdemProducao_Item.Close;
  DMOrdemproducao.QOrdemProducao_Item.Open;
  DMOrdemProducao.QOrdemProducao_Cab .open;
end;

procedure TFOrdemProducaoCad.OrdemdeProduo1Click(Sender: TObject);
var wUsuario : string;
begin
  inherited;
  If FFormulaParam = Nil then
    FFormulaParam := TFFormulaParam.Create(Application);
  FFormulaParam.PGRelatorio.Pages[4].TabVisible := True;
  If FFormulaParam.ShowModal = mrOk then
  With DMOrdemProducao do
  Begin
    if FFormulaParam.RG4Tipo.ItemIndex = 1 then
    Begin
      QRComponenteProducao.Close;
      QOrdemProducao_Cab.Close;
      if Trim(FFormulaParam.Me4Ordem.Text) <> '' then
      Begin
        QRComponenteProducao.SetVariable('ORDEM',FFormulaParam.ME4Ordem.Text);
        QOrdemProducao_Cab.SetVariable('PK',FFormulaParam.ME4Ordem.Text);
      end
      else
        Raise Exception.Create('Informe uma Ordem de Produção!');
      QRComponenteProducao.Open;
      QOrdemProducao_Cab.Open;
      If FRComponenteProducao = Nil then
        FRComponenteProducao := TFRComponenteProducao.Create(Application);
        FRComponenteProducao.QRLTitulo.Caption := 'Componentes para a Ordem de Produção Nº' + IntToStr(QRComponenteProducaoCOD_ORDEM_PRODUCAO_CAB.Value);
        wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO ='+ IntToStr(QOrdemProducao_CabCOD_USUARIO.Value));
        FRComponenteProducao.QRLusuario.Caption := 'Usuário: ' + IntToStr(QOrdemProducao_CabCOD_USUARIO.Value)+ ' ' + wUsuario;
        FRComponenteProducao.QRLPeriodo.Caption := 'Período: ' + Trim(QOrdemProducao_CabDT_PERIODO_I.Text) + ' até ' + Trim(QOrdemProducao_CabDT_PERIODO_F.Text);
      If FFormulaParam.RGPreview.ItemIndex = 0 then
        FRComponenteProducao.QRPrimario.Preview
      Else
        FRComponenteProducao.QRPrimario.Print;
      QRComponenteProducao.Close;
      QOrdemProducao_Cab.Close;
    end
    else
    if FFormulaParam.RG4Tipo.ItemIndex = 0 then
    Begin
      QRComponenteProducao1.Close;
      QOrdemProducao_Cab.Close;
      if Trim(FFormulaParam.Me4Ordem.Text) <> '' then
      Begin
        QRComponenteProducao1.SetVariable('ORDEM',FFormulaParam.ME4Ordem.Text);
        QOrdemProducao_Cab.SetVariable('PK',FFormulaParam.ME4Ordem.Text);
      end
      else
        Raise Exception.Create('Informe uma Ordem de Produção!');
      QRComponenteProducao1.Open;
      QOrdemProducao_Cab.Open;
      If FRComponenteProducao1 = Nil then
        FRComponenteProducao1 := TFRComponenteProducao1.Create(Application);
        FRComponenteProducao1.QRLTitulo.Caption := 'Componentes para a Ordem de Produção Nº' + IntToStr(QRComponenteProducao1COD_ORDEM_PRODUCAO_CAB.Value);
        wUsuario := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO ='+ IntToStr(QOrdemProducao_CabCOD_USUARIO.Value));
        FRComponenteProducao1.QRLusuario.Caption := 'Usuário: ' + IntToStr(QOrdemProducao_CabCOD_USUARIO.Value)+ ' ' + wUsuario;

      If FFormulaParam.RGPreview.ItemIndex = 0 then
        FRComponenteProducao1.QRPrimario.Preview
      Else
        FRComponenteProducao1.QRPrimario.Print;
      QRComponenteProducao1.Close;
      QOrdemProducao_Cab.Close;
    end;  
  End;

end;

procedure TFOrdemProducaoCad.EtiquetaProdAcabado1Click(Sender: TObject);
var
wcont, wCont2, wQtd, wQtd1, wLote :integer;
wNum_Controle, wProduto, wComando, wNum_Volume : string;
begin
  inherited;
  If ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') OR
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LUNASA')) then
  Begin
    wcont := 1;
    wCont2 := 0;
    wQtd1 := 0;
  If FFormulaParam = Nil then
    FFormulaParam := TFFormulaParam.Create(Application);
  FFormulaParam.PGRelatorio.Pages[4].TabVisible := True;
  If FFormulaParam.ShowModal = mrOk then
  Begin
    with DMOrdemProducao do
      begin
        QEtiqueta.Close;
        QEtiqueta.open;
      if QEtiqueta.RecordCount > 0 then
        begin
          QEtiqueta.First;
        while not QEtiqueta.Eof do
          QEtiqueta.Delete;
        end;
      end;
    with DMOrdemProducao do
      begin
        QREtiquetaProdAcabado.Close;
        if Trim(FFormulaParam.Me4Ordem.Text) <> '' then
          QREtiquetaProdAcabado.SetVariable('ORDEM',FFormulaParam.Me4Ordem.Text)
        else
         Raise Exception.Create('É preciso informar a ordem de produção!');
        if Trim(FFormulaParam.Me4Classe.Text) = '' then
          QREtiquetaProdAcabado.SetVariable('CLASSE',Null)
        else
          QREtiquetaProdAcabado.SetVariable('CLASSE',FFormulaParam.Me4Classe.Text);

        QREtiquetaProdAcabado.Open;
        QREtiquetaProdAcabado.First;
    Try
      DMoracle.DBCemapa.StartTransaction;
    while not QREtiquetaProdAcabado.Eof do
      begin
        If QREtiquetaProdAcabadoNUM_VOLUMES.Value < 1 then
          QREtiquetaProdAcabadoNUM_VOLUMES.Text := '1';
        wQtd := StrToInt(QREtiquetaProdAcabadoQT_MAXIMO.Text);//* StrToint(QREtiquetaProdAcabadoNUM_VOLUMES.Text);

        if wQtd > 0 then
        Begin

          if ((wQtd <> 1) and (wQtd1 < wQtd)) then
          Begin
            while ((wQtd <> 1) and (wQtd1 < wQtd)) do
              Begin
                if wcont = 1 then
                Begin
                  if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                    wCont2 := 1;
                  QEtiqueta.Insert;
                  QEtiquetaETIQUETA1.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                              +QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                  inc(wCont2);
                end;

                if wcont = 2 then
                Begin
                  if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                    wCont2 := 1;
                  QEtiquetaETIQUETA2.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                              + QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                  inc(wCont2);
                end;

                if wcont = 3 then
                Begin
                  if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                    wCont2 := 1;
                  QEtiquetaETIQUETA3.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                              + QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                  inc(wCont2);
                end;

                if wcont = 4 then
                Begin
                  if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                    wCont2 := 1;
                  QEtiquetaETIQUETA4.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                              + QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                inc(wCont2);
                end;

                if wcont = 5 then
                Begin
                  if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                    wCont2 := 1;
                  QEtiquetaETIQUETA5.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                             RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                              + QREtiquetaProdAcabadoNUM_VOLUMES.Text;

                  QEtiqueta.Post;
                  inc(wCont2);
                end;

                if wcont = 5 then
                  Begin
                    wCont := 1;
                    inc(wQtd1);
                  end
                else
                Begin
                  inc(wcont);
                  inc(wQtd1);
                end;
              end;
              wQtd1 := 0;
              end
            else
            Begin
              if wcont = 1 then
              Begin
                if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                  wCont2 := 1;
                QEtiqueta.Insert;
                QEtiquetaETIQUETA1.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                           RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                           + QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                inc(wCont2);
              end;

              if wcont = 2 then
              Begin
                if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                  wCont2 := 1;
                QEtiquetaETIQUETA2.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                           RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                            + QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                inc(wCont2);
              end;

              if wcont = 3 then
              Begin
                if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                  wCont2 := 1;
                QEtiquetaETIQUETA3.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                           RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                            + QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                inc(wCont2);
              end;
              if wcont = 4 then
              Begin
                if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                  wCont2 := 1;
                QEtiquetaETIQUETA4.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                           RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                            + QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                inc(wCont2);
              end;

              if wcont = 5 then
              Begin
                if ((QREtiquetaProdAcabadoNUM_VOLUMES.Text <= '1') or (wCont2 = 0)
                     or (wCont2 > QREtiquetaProdAcabadoNUM_VOLUMES.Value))then
                  wCont2 := 1;  
                QEtiquetaETIQUETA5.Value:= Bib.StrZero(IntToStr(DMSequencia.Sequencia(1,'PRODUCAO-CGS')),6) +
                                           RMaskCGC_CPF(QREtiquetaProdAcabadoCOD_PRODUTO.Text,6)
                                            + QREtiquetaProdAcabadoNUM_VOLUMES.Text;
                QEtiqueta.Post;
                inc(wCont2);
              end;

              if wCont = 5 then
                wCont := 1
              else
                inc(wcont);
              end;
            end;
            QREtiquetaProdAcabado.Next;
          end;
          DMOracle.DBCemapa.Commit;
          except
              ShowMessage('Erro na Gravação do Lançamento da Produção');
              DMOracle.DBCemapa.Rollback;
            raise;
         end;
        if FREtiquetaProdAcabado = nil then
          FREtiquetaProdAcabado:=TFREtiquetaProdAcabado.Create(Application);
        FREtiquetaProdAcabado.QuickRep1.Preview;
        DMOracle.DBCemapa.Commit;
        QREtiquetaProdAcabado.Close;
       end;
    end;
  end;
end;
procedure TFOrdemProducaoCad.MELocalizaClick(Sender: TObject);
begin
  inherited;
  if Trim(MELocaliza.Text) <> '' then
  Begin
    DMOrdemProducao.QOrdemProducao_Item.CLose;
    DMOrdemProducao.QOrdemProducao_item.SetVariable('ORDEM_PRODUCAO_CAB',MeLocaliza.Text);
    DMOrdemProducao.QOrdemProducao_Item.Open;
  end;
end;

procedure TFOrdemProducaoCad.MELocalizaChange(Sender: TObject);
begin
  inherited;
  if Trim(MELocaliza.Text) <> '' then
  Begin
    DMOrdemProducao.QOrdemProducao_Item.CLose;
    DMOrdemProducao.QOrdemProducao_item.SetVariable('ORDEM_PRODUCAO_CAB',MeLocaliza.Text);
    DMOrdemProducao.QOrdemProducao_Item.Open;
  end;
end;

procedure TFOrdemProducaoCad.LanarComponentes1Click(Sender: TObject);
begin
  inherited;
  If FLancaComponente = Nil then
    FLancaComponente := TFLancaComponente.Create(Application);
  FLancaComponente.showmodal;
end;

end.
